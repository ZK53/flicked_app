import 'dart:convert';

import 'package:flicked_app/models/app_config.dart';
import 'package:flicked_app/services/dio_service.dart';
import 'package:flicked_app/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class SplashView extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashView({super.key, required this.onInitializationComplete});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then(
      (_) => _setup(context).then((_) => widget.onInitializationComplete()),
    );
  }

  Future<void> _setup(BuildContext context) async {
    // uploading the content of the config file
    final configFile = await rootBundle.loadString("assets/config/main.json");
    final configData = jsonDecode(configFile);

    // creating an instance of get_it
    final GetIt getIt = GetIt.instance;

    // creating an instance of the app config model
    getIt.registerSingleton<AppConfig>(AppConfig.formJson(configData));

    // creating an instance of the dio service
    getIt.registerSingleton<DioService>(DioService());

    // creating an instance of the movie service
    getIt.registerSingleton<MovieService>(MovieService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Filcked",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
