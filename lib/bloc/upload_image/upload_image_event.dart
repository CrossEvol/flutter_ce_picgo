part of 'upload_image_bloc.dart';

sealed class UploadImageEvent extends Equatable {
  const UploadImageEvent();
}

final class UploadImageEventLoad extends UploadImageEvent {
  @override
  List<Object?> get props => [];
}

final class UploadImageEventAdd extends UploadImageEvent {
  final List<UploadedImage> uploadedImages;

  @override
  List<Object?> get props => [uploadedImages];

  const UploadImageEventAdd({
    required this.uploadedImages,
  });
}

final class UploadImageEventUpdate extends UploadImageEvent {
  final String filepath;
  String? url;
  String? name;
  UploadState? state;
  String? sha;

  @override
  List<Object?> get props => [url, name, state, sha];

  UploadImageEventUpdate(
      {required this.filepath, this.url, this.name, this.state, this.sha});
}

final class UploadImageEventRemove extends UploadImageEvent {
  final int id;
  final String filepath;

  @override
  List<Object?> get props => [id, filepath];

  const UploadImageEventRemove({
    required this.id,
    required this.filepath,
  });
}
