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

  @override
  List<Object?> get props => [url, name, state];

  UploadImageEventUpdate({
    required this.filepath,
    this.url,
    this.name,
    this.state,
  });
}
