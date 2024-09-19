class ImageItemGroup {
  String parentPath;
  List<ImageItemVO> items;

  ImageItemGroup(this.parentPath, this.items);
}

class ImageItemVO {
  int id;
  String name;
  String remoteUrl;
  bool selected;
  String parentPath;

  ImageItemVO({
    required this.id,
    required this.name,
    required this.remoteUrl,
    required this.selected,
    required this.parentPath,
  });
}