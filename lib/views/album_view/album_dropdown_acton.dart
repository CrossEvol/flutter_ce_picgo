import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/constants/shared_preferences_keys.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';

typedef VoidCallback = void Function();

class AlbumDropdownActon extends StatefulWidget {
  const AlbumDropdownActon({super.key});

  @override
  State<AlbumDropdownActon> createState() => _AlbumDropdownActonState();
}

class _AlbumDropdownActonState extends State<AlbumDropdownActon> {
  @override
  Widget build(BuildContext context) {
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
                  MenuItems.onChanged(context, item);
                });
              }),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            MenuItems.onChanged(context, value!);
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
  static bool canDrag =
      prefs.getBool(SharedPreferencesKeys.dragAndDrop.name) ?? false;
  static bool multiUpload =
      prefs.getBool(SharedPreferencesKeys.multiUpload.name) ?? false;
  static bool canRename =
      prefs.getBool(SharedPreferencesKeys.settingIsUploadedRename.name) ??
          false;

  static var drag = MenuItem(
      text: 'Drag', isChecked: canDrag, setting: AlbumSettings.canDrag);
  static var multi = MenuItem(
      text: 'Multi',
      isChecked: multiUpload,
      setting: AlbumSettings.supportMultiUpload);
  static var rename = MenuItem(
      text: 'Rename', isChecked: canRename, setting: AlbumSettings.canRename);

  static Widget buildItem(MenuItem item, VoidCallback callback) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          onChanged: (bool? value) {
            callback();
          },
          value: item.isChecked,
        ),
        // Icon(item.icon, color: Colors.grey[800], size: 22),
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

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item.setting) {
      case AlbumSettings.canDrag:
        item.isChecked = !item.isChecked;
        prefs.setBool(SharedPreferencesKeys.dragAndDrop.name, item.isChecked);
        break;
      case AlbumSettings.supportMultiUpload:
        item.isChecked = !item.isChecked;
        prefs.setBool(SharedPreferencesKeys.multiUpload.name, item.isChecked);
        break;
      case AlbumSettings.canRename:
        item.isChecked = !item.isChecked;
        prefs.setBool(
            SharedPreferencesKeys.settingIsUploadedRename.name, item.isChecked);
        break;
    }
  }
}
