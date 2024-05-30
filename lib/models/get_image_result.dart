class GetImagesResult  {
  final String name;
  final String remoteUrl;
  final String downloadUrl;
  final String sha;

  const GetImagesResult({
    required this.name,
    required this.remoteUrl,
    required this.downloadUrl,
    required this.sha,
  });
}