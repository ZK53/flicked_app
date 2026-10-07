import 'dart:ui';

import 'package:flicked_app/models/search_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerWidget {
  late double _deviceHeight;
  late double _deviceWidth;
  final TextEditingController _searchController = TextEditingController();

  MainView({super.key});

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
          children: [_backgroundWidget(), _foregroundWidgets()],
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

  Widget _foregroundWidgets() {
    return Container(
      padding: EdgeInsets.only(top: _deviceHeight * 0.02),
      width: _deviceWidth * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start, // TODO: change it to end
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_topBarWidget()],
      ),
    );
  }

  Widget _topBarWidget() {
    return Container(
      height: _deviceHeight * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_searchFieldWidget(), _categorySelectionWidget()],
      ),
    );
  }

  Widget _searchFieldWidget() {
    final InputBorder _border = InputBorder.none;

    return Container(
      width: _deviceWidth * 0.5,
      height: _deviceHeight * 0.05,
      child: TextField(
        controller: _searchController,
        onSubmitted: (input) {},
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: _border,
          border: _border,
          prefixIcon: Icon(Icons.search, color: Colors.white24),
          hintStyle: TextStyle(color: Colors.white54),
          filled: false,
          fillColor: Colors.white24,
          hintText: "Search....",
        ),
      ),
    );
  }

  Widget _categorySelectionWidget() {
    return DropdownButton(
      value: SearchCategory.popular,
      dropdownColor: Colors.black38,
      icon: Icon(Icons.menu, color: Colors.white24),
      underline: Container(height: 1, color: Colors.white24),
      items: [
        DropdownMenuItem(
          value: SearchCategory.popular,
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white24),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.upcoming,
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white24),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.none,
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white24),
          ),
        ),
      ],
      onChanged: (value) {},
    );
  }
}
