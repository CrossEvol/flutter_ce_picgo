
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/image_manage/image_manage_bloc.dart';
import 'package:flutter_ce_picgo/bloc/selected_images/selected_images_bloc.dart';


class RemoveAction extends StatefulWidget {
  final String storageType;

  const RemoveAction({super.key, required this.storageType});

  @override
  State<RemoveAction> createState() => _RemoveActionState();
}

class _RemoveActionState extends State<RemoveAction> {
  _RemoveActionState();

  @override
  Widget build(BuildContext context) {
    int totalCount = 40;
    return BlocBuilder<SelectedImagesBloc, SelectedImagesState>(
        builder: (context, state) {
          var selectedCount = state.selectedIDs.length;
          return selectedCount == 0
              ? FilledButton.tonal(
            onPressed: null,
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(const Size(100.0, 40.0)),
            ),
            child: const Text('确认'),
          )
              : FilledButton(
            onPressed: () {
              var ids = context.read<SelectedImagesBloc>().state.selectedIDs;
              context.read<ImageManageBloc>().add(ImageManageEventDelete(
                storageType: widget.storageType,
                ids: ids,
              ));
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith(
                      (states) => Theme.of(context).colorScheme.error),
              minimumSize: WidgetStateProperty.all(const Size(120.0, 40.0)),
            ),
            child: Text(
              '确认($selectedCount/$totalCount)',
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
