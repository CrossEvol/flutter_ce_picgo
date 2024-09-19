import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/common/interfaces/interface.dart';

class ImageItemNetwork extends StatelessWidget implements ImageItemWidget {
  final String imageUrl;

  const ImageItemNetwork({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        // width: 300,
        // height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            // colorFilter:
            //     const ColorFilter.mode(Colors.red, BlendMode.colorBurn),
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
