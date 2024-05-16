# flutter_ce_picgo

A new Flutter project.

# Todo
- configure json_serializable rules in build.yaml, include fieldRename to snake
- File support in web platform

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Notes

## extended_image error

```shell
lib/widgets/upload_item/upload_item.dart:66:13: Error: The argument type 'File/*1*/' can't be assigned to the parameter type 'File/*2*/'.
 - 'File/*1*/' is from 'dart:io'.
 - 'File/*2*/' is from 'package:extended_image_library/src/_platform_web.dart' ('/C:/Users/mizuk/AppData/Local/Pub/Cache/hosted/pub.flutter-io.cn/extended_image_library-4.0.1/lib/src/_platform_web.dart').
            File(widget.file.path),
```

in web platform, File class lack of compatibility.

## CrossFile not support
`github_image_upload.dart`
```dart
    final file = XFile(uploadedImage.filepath);
```

```shell
┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
│ #0   packages/flutter_ce_picgo/views/upload_screen.dart 52:23            <fn>
├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
│ ⛔ UnimplementedError: CrossFile is not available in your current platform.
└───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```

## Image.network failed when using gitee
```shell
======== Exception caught by image resource service ================================================
The following ProgressEvent$ object was thrown resolving an image codec:
  [object ProgressEvent]

When the exception was thrown, this was the stack: 
Image provider: NetworkImage("https://gitee.com/youmuao/picgo_repo/raw/master/1715856977331000.jpg", scale: 1.0)
Image key: NetworkImage("https://gitee.com/youmuao/picgo_repo/raw/master/1715856977331000.jpg", scale: 1.0)
====================================================================================================
```