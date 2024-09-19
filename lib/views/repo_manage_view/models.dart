class ImageItemGroup {
  String parentPath;
  List<ImageItemVO> items;

  ImageItemGroup(this.parentPath, this.items);
}

class ImageItemVO {
  int id;
  String name;
  String remoteUrl;
  String downloadUrl;
  bool selected;
  String parentPath;

  ImageItemVO({
    required this.id,
    required this.name,
    required this.remoteUrl,
    required this.downloadUrl,
    required this.selected,
    required this.parentPath,
  });
}
