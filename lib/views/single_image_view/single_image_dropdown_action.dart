import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SingleImageDropdownAction extends StatefulWidget {
  final VoidCallback downloadImage;
  final VoidCallback copyLink;
  final VoidCallback toggleShow;

  const SingleImageDropdownAction(
      {super.key,
      required this.downloadImage,
      required this.copyLink,
      required this.toggleShow});

  @override
  State<SingleImageDropdownAction> createState() =>
      _SingleImageDropdownActionState();
}

class _SingleImageDropdownActionState extends State<SingleImageDropdownAction> {
  _SingleImageDropdownActionState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTap(MenuItemKey itemKey) {
    switch (itemKey) {
      case MenuItemKey.copyLink:
        widget.copyLink();
        break;
      case MenuItemKey.share:
        break;
      case MenuItemKey.download:
        widget.downloadImage();
      case MenuItemKey.cancel:
        break;
      case MenuItemKey.showFab:
        widget.toggleShow();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: const Icon(
          Icons.list,
          size: 32,
          color: Colors.white,
        ),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
              onTap: () => onTap(item.key),
            ),
          ),
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
              onTap: () => onTap(item.key),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value! as MenuItem);
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
            8,
            ...List<double>.filled(MenuItems.secondItems.length, 48),
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}

enum MenuItemKey { copyLink, share, download, cancel, showFab }

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
    required this.key,
  });

  final String text;
  final IconData icon;
  final MenuItemKey key;
}

class MenuItems {
  static const List<MenuItem> firstItems = [like, share, download];
  static const List<MenuItem> secondItems = [show, cancel];

  static const like =
      MenuItem(text: 'CopyLink', icon: Icons.copy, key: MenuItemKey.copyLink);
  static const share =
      MenuItem(text: 'Share', icon: Icons.share, key: MenuItemKey.share);
  static const download = MenuItem(
      text: 'Download', icon: Icons.download, key: MenuItemKey.download);
  static const cancel =
      MenuItem(text: 'Cancel', icon: Icons.cancel, key: MenuItemKey.cancel);
  static const show = MenuItem(
      text: 'ShowFab', icon: Icons.visibility, key: MenuItemKey.showFab);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: Colors.blueGrey,
          size: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.like:
        //Do something
        break;
      case MenuItems.share:
        //Do something
        break;
      case MenuItems.download:
        //Do something
        break;
      case MenuItems.show:
        //Do something
        break;
      case MenuItems.cancel:
        //Do something
        break;
    }
  }
}
