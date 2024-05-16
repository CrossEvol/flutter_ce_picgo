part of 'upload_image_bloc.dart';

sealed class UploadImageEvent extends Equatable {
  const UploadImageEvent();
}

final class UploadImageEventLoad extends UploadImageEvent {
  @override
  List<Object?> get props => [];
}

final class UploadImageEventAdd extends UploadImageEvent {
  final UploadedImage uploadedImage;

  @override
  List<Object?> get props => [uploadedImage];

  const UploadImageEventAdd({
    required this.uploadedImage,
  });
}

final class UploadImageEventUpdate extends UploadImageEvent {
  final String filepath;
  String? url;
  String? name;
  UploadState? state;
  String? sha;

  @override
  List<Object?> get props => [url, name, state,sha];

  UploadImageEventUpdate({
    required this.filepath,
    this.url,
    this.name,
    this.state,
    this.sha
  });
}
