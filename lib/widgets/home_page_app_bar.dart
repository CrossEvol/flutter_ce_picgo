import 'package:flutter/material.dart';

class HomePageAppBar extends AppBar {
  HomePageAppBar({super.key, required title})
      : super(
          title: Text(title),
          titleTextStyle: const TextStyle(color: Colors.white,fontSize: 24.0),
          // Default title
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: const SizedBox(),
          actions: [],
        );
}
