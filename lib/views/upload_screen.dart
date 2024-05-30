import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/image_cache/image_cache_bloc.dart';
import 'package:flutter_ce_picgo/bloc/upload_image/upload_image_bloc.dart';
import 'package:flutter_ce_picgo/service/repo/storage_service_factory.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';

import '../models/enums/uploaded_state.dart';
import '../utils/logger_util.dart';
import '../widgets/stateless_upload_item.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  _UploadScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UploadScreen'),
      ),
      body: BlocBuilder<UploadImageBloc, UploadImageState>(
        builder: (context, state) {
          if (state.images.isEmpty) {
            return const Center(child: Text('Empty List'));
          }

          return ListView.builder(
              itemCount: state.images.length,
              itemBuilder: (context, index) {
                var image = state.images[index];
                if (image.state == UploadState.uploading) {
                  logger.w('start uploading...');
                  Future.delayed(const Duration(seconds: 1), () async {
                    try {
                      var type = await prefs.getDefaultStorage();
                      var storageService = StorageServiceFactory.instance
                          .getUploadStrategy(type);
                      var xFile = context
                          .read<ImageCacheBloc>()
                          .state
                          .imageCache[image.filepath];
                      var (url, state, sha) = await storageService.upload(
                          xFile: xFile!,
                          rename:
                              '${DateTime.now().microsecondsSinceEpoch}.jpg');
                      logger.w('end uploading...');
                      context.read<UploadImageBloc>().add(
                          UploadImageEventUpdate(
                              filepath: image.filepath,
                              url: url,
                              state: state,
                              sha: sha));
                      context
                          .read<ImageCacheBloc>()
                          .add(ImageCacheEventRemove(key: image.filepath));
                    } catch (e) {
                      logger.e(e);
                      context.read<UploadImageBloc>().add(
                          UploadImageEventUpdate(
                              filepath: image.filepath,
                              url: image.url,
                              state: UploadState.uploadFailed,
                              sha: image.sha));
                    }
                  });
                }
                return Dismissible(
                  key: Key(state.images[index].filepath),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (DismissDirection direction) async {
                    final image = state.images[index];
                    context.read<UploadImageBloc>().add(UploadImageEventRemove(
                        id: image.id, filepath: image.filepath));
                  },
                  child: StatelessUploadItem(
                    uploadedImage: state.images[index],
                    fToast: fToast,
                  ),
                );
              });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
