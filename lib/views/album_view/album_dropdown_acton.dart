import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/settings/settings_bloc.dart';

typedef VoidCallback = void Function();

class AlbumDropdownActon extends StatefulWidget {
  const AlbumDropdownActon({super.key});

  @override
  State<AlbumDropdownActon> createState() => _AlbumDropdownActonState();
}

class _AlbumDropdownActonState extends State<AlbumDropdownActon> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: const Icon(
              Icons.settings,
              size: 32,
              color: Colors.white,
            ),
            items: [
              ...MenuItems.firstItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item, () {
                    setState(() {
                      MenuItems.onChanged(context, item, state);
                    });
                  }, state),
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                MenuItems.onChanged(context, value!, state);
              });
            },
            dropdownStyleData: DropdownStyleData(
              width: 160,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              offset: const Offset(0, 8),
            ),
            menuItemStyleData: MenuItemStyleData(
              customHeights: [
                ...List<double>.filled(MenuItems.firstItems.length, 48),
              ],
              padding: const EdgeInsets.only(left: 16, right: 16),
            ),
          ),
        );
      },
    );
  }
}

class MenuItem {
  MenuItem({
    required this.text,
    required this.setting,
    required this.isChecked,
  });

  final String text;
  bool isChecked;
  final AlbumSettings setting;
}

enum AlbumSettings { canDrag, supportMultiUpload, canRename }

abstract class MenuItems {
  static List<MenuItem> firstItems = [drag, multi, rename];

  static var drag =
      MenuItem(text: 'Drag', isChecked: false, setting: AlbumSettings.canDrag);
  static var multi = MenuItem(
      text: 'Multi',
      isChecked: false,
      setting: AlbumSettings.supportMultiUpload);
  static var rename = MenuItem(
      text: 'Rename', isChecked: false, setting: AlbumSettings.canRename);

  static Widget buildItem(
      MenuItem item, VoidCallback callback, SettingsState state) {
    switch (item.setting) {
      case AlbumSettings.canDrag:
        item.isChecked = state.canDragAndDrop;
        break;
      case AlbumSettings.supportMultiUpload:
        item.isChecked = state.supportMultiUpload;
        break;
      case AlbumSettings.canRename:
        item.isChecked = state.canRenameUploaded;
        break;
    }

    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          onChanged: (bool? value) {
            callback();
          },
          value: item.isChecked,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(
      BuildContext context, MenuItem item, SettingsState state) {
    final settingsBloc = context.read<SettingsBloc>();
    switch (item.setting) {
      case AlbumSettings.canDrag:
        settingsBloc.add(ToggleCanDragAndDropEvent(canDragAndDrop: !state.canDragAndDrop));
        break;
      case AlbumSettings.supportMultiUpload:
        settingsBloc.add(
            ToggleSupportMultiUploadEvent(supportMultiUpload: !state.supportMultiUpload));
        break;
      case AlbumSettings.canRename:
        settingsBloc.add(ToggleCanRenameUploadedEvent(
            canRenameUploaded: !state.canRenameUploaded));
        break;
    }
  }
}
