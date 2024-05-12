import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget watchLoadStateWidget(ExtendedImageState state,
    {double iconSize = 16}) {
  switch (state.extendedImageLoadState) {
    case LoadState.loading:
      return Center(
        child: Center(
          child: SizedBox(
            width: iconSize,
            height: iconSize,
            child: const CupertinoActivityIndicator(),
          ),
        ),
      );
    case LoadState.failed:
      return GestureDetector(
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Icon(
              Icons.error,
              size: iconSize,
              color: Colors.grey[600],
            )
          ],
        ),
        onTap: () {
          state.reLoadImage();
        },
      );
    default:
      return const Text('OK');
  }
}

class MiniActivityIndicator {}
