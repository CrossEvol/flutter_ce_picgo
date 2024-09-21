part of 'd_upload_image_bloc.dart';

sealed class DUploadImageEvent extends Equatable {
  const DUploadImageEvent();
}

final class UploadImageEventLoad extends DUploadImageEvent {
  @override
  List<Object?> get props => [];
}

final class UploadImageEventAdd extends DUploadImageEvent {
  final UploadedImage uploadedImage;

  @override
  List<Object?> get props => [uploadedImage];

  const UploadImageEventAdd({
    required this.uploadedImage,
  });
}

final class UploadImageEventUpdate extends DUploadImageEvent {
  final String filepath;
  String? url;
  String? name;
  UploadState? state;

  @override
  List<Object?> get props => [url, name, state];

  UploadImageEventUpdate({
    required this.filepath,
    this.url,
    this.name,
    this.state,
  });
}
