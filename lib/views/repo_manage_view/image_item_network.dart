import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/common/interfaces/interface.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/router/router_extra.dart';
import 'package:go_router/go_router.dart';

class ImageItemNetwork extends StatelessWidget implements ImageItemWidget {
  final String name;
  final String downloadUrl;
  final String remoteUrl;

  const ImageItemNetwork(
      {super.key,
      required this.name,
      required this.downloadUrl,
      required this.remoteUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(
          '/image',
          extra: ImageExtra.remote(
              name: name,
              remoteUrl: remoteUrl,
              downloadUrl: downloadUrl,
              type: ImageStorageType.github.name),
        );
      },
      child: CachedNetworkImage(
        imageUrl: downloadUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
