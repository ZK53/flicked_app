import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerWidget {
  late final double _deviceHeight;
  late final double _deviceWidth;

  @override
  Widget build(BuildContext context, WidgetRef watch) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return _buildUi();
  }

  Widget _buildUi() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [_backgroundWidget()],
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://m.media-amazon.com/images/M/MV5BODE2NTdmMmYtY2U1OS00MjExLWIwNjQtYjQ5NTA0ZDZmZjZiXkEyXkFqcGc%40._V1_.jpg",
          ),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.2)),
        ),
      ),
    );
  }
}
