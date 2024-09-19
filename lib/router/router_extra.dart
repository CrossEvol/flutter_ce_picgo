class ImageExtra {
  String name;
  String localUrl;
  String remoteUrl;
  String downloadUrl;
  String type;

  ImageExtra.local({
    required this.name,
    required this.localUrl,
    required this.type,
  })  : remoteUrl = "",
        downloadUrl = "";

  ImageExtra.remote({
    required this.name,
    required this.remoteUrl,
    required this.downloadUrl,
    required this.type,
  }) : localUrl = "";

  ImageExtra({
    required this.name,
    required this.localUrl,
    required this.remoteUrl,
    required this.downloadUrl,
    required this.type,
  });
}
