import 'package:flutter/material.dart';

class HomePageAppBar extends AppBar {
  HomePageAppBar(
      {super.key,
      required title,
      required backgroundColor,
      List<Widget>? actions})
      : super(
          title: Text(title),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24.0),
          // Default title
          centerTitle: true,
          backgroundColor: backgroundColor,
          leading: const SizedBox(),
          actions: actions ?? [],
        );
}
