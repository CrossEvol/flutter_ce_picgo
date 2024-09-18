import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/router/router_extra.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart'; // 新增导入

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
          Switch( // 新增开关
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
        child: Image(
          image: FileImage(File(widget.imageExtra.localUrl)),
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

  Future<void> _downloadImage() async { // 新增下载图片方法
    final directory = await getDownloadsDirectory();
    final path = '${directory?.path}\\${widget.imageExtra.localUrl.split('\\').last}';
    final file = File(widget.imageExtra.localUrl);
    final newFile = await file.copy(path);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Image saved to ${newFile.path}')),
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
