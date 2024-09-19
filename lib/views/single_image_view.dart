import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/router/router_extra.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart'; // 新增导入
import 'package:http/http.dart' as http; // 新增导入

class SingleImageView extends StatefulWidget {
  final ImageExtra imageExtra;

  const SingleImageView({super.key, required this.imageExtra});

  @override
  State<SingleImageView> createState() => _SingleImageViewState();
}

class _SingleImageViewState extends State<SingleImageView> {
  bool _showFab = true; // 新增变量

  _SingleImageViewState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // 获取主题

    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleImageView'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/repo/${widget.imageExtra.type}');
          },
        ),
        actions: [
          Switch(
            // 新增开关
            value: _showFab,
            onChanged: (value) {
              setState(() {
                _showFab = value;
              });
            },
            activeColor: theme.colorScheme.primary, // 使用主题颜色
          ),
        ],
      ),
      body: Center(
        child: widget.imageExtra.localUrl.isNotEmpty
            ? Image(
                image: FileImage(File(widget.imageExtra.localUrl)),
              )
            : Center(
                child: CachedNetworkImage(
                  imageUrl: widget.imageExtra.downloadUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitWidth,
                        scale: 1.0,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
      ),
      floatingActionButton: _showFab // 根据开关状态显示或隐藏浮动按钮
          ? FloatingActionButton(
              onPressed: _downloadImage,
              backgroundColor: theme.colorScheme.primary,
              child: const Icon(Icons.download), // 使用主题颜色
            )
          : null,
    );
  }

  Future<void> _downloadImage() async {
    final directory = await getDownloadsDirectory();
    final path = '${directory?.path}\\${widget.imageExtra.name}';

    if (widget.imageExtra.localUrl.isNotEmpty) {
      final file = File(widget.imageExtra.localUrl);
      final newFile = await file.copy(path);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image saved to ${newFile.path}')),
      );
    } else {
      final response = await http.get(Uri.parse(widget.imageExtra.downloadUrl));
      if (response.statusCode == 200) {
        final file = File(path);
        await file.writeAsBytes(response.bodyBytes);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image downloaded to ${file.path}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to download image')),
        );
      }
    }
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
