part of 'image_manage_bloc.dart';

enum ImageManageStatus { initial, loading, done }

final class ImageManageState extends Equatable {
  final List<DownloadedImage> images;

  final ImageManageStatus status;

  int get totalCount => images.length;

  List<ImageItemGroup> get imageItemGroups => groupImagesByParentPath(images);

  @override
  List<Object?> get props => [images, totalCount, imageItemGroups];

  const ImageManageState({
    required this.images,
    required this.status,
  });

  ImageManageState copyWith({
    List<DownloadedImage>? images,
    ImageManageStatus? status,
  }) {
    return ImageManageState(
      images: images ?? this.images,
      status: status ?? this.status,
    );
  }
}

List<ImageItemGroup> groupImagesByParentPath(List<DownloadedImage> images) {
  final Map<String, List<ImageItemVO>> groupedMap = {};
  for (var image in images
      .map((e) => ImageItemVO(
          id: e.id,
          name: e.name,
          remoteUrl: e.remoteUrl,
          selected: false,
          parentPath: e.parentPath))
      .toList()) {
    if (!groupedMap.containsKey(image.parentPath)) {
      groupedMap[image.parentPath] = [];
    }
    groupedMap[image.parentPath]!.add(image);
  }
  return groupedMap.entries
      .map((entry) => ImageItemGroup(entry.key, entry.value))
      .toList();
}
