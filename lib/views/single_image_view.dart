import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/router/router_extra.dart';
import 'package:go_router/go_router.dart';

class SingleImageView extends StatefulWidget {
  final ImageExtra imageExtra;

  const SingleImageView({super.key, required this.imageExtra});

  @override
  State<SingleImageView> createState() => _SingleImageViewState();
}

class _SingleImageViewState extends State<SingleImageView> {
  _SingleImageViewState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleImageView'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/repo/${widget.imageExtra.type}');
          },
        ),
      ),
      body: Center(
        child: Image(
          image: FileImage(File(widget.imageExtra.localUrl)),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
