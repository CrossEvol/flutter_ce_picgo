import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImageCacheModel extends ChangeNotifier {
  Map<String, XFile> imageCache = {};

  XFile? getXFile(String key) => imageCache[key];

  void setImageCache(String key, XFile xFile) {
    imageCache[key] = xFile;
    notifyListeners();
  }
}
