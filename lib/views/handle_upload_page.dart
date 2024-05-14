import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';

import '../widgets/upload_item/upload_item.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';

class HandleUploadPage extends StatefulWidget {
  const HandleUploadPage({super.key});

  // final List<AssetEntity> assets;
  //
  // HandleUploadScreen(this.assets, {Key key}) : super(key: key);

  @override
  State<HandleUploadPage> createState() => _HandleUploadPageState();
}

class _HandleUploadPageState extends State<HandleUploadPage> {
  String _title = '';
  bool isParse = false;
  List<File> files = [];
  List<String> filesName = [];

  final TextEditingController _controller = TextEditingController();

  /// 通知提示
  bool needNotify = false;

  // _HandleUploadScreenState() {
  //   SpUtil.getInstance().then((sp) {
  //     this.needNotify =
  //         sp.getBool(SharedPreferencesKeys.settingIsUploadedTip) ?? false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _getCurrentPb();
    _parseAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
      ),
      body: isParse ? buildList() : buildParseTip(),
    );
  }

  Widget buildList() {
    return Column(
      children: buildUploadItem(),
    );
  }

  List<UploadItem> buildUploadItem() {
    if (files == null || files.isEmpty) {
      return [];
    }

    List<UploadItem> items = [];
    for (int i = 0; i < files.length; i++) {
      items.add(UploadItem(
        files[i],
        filesName[i],
        needNotify: needNotify,
      ));
    }
    return items;
  }

  Widget buildParseTip() {
    return const Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
      ),
    );
  }

  _getCurrentPb() async {
    var type = await prefs.getDefaultStorage();
    var name = await dbProvider.getImageStorageSettingName(type: type);
    // String pbType = await ImageUploadUtils.getDefaultPB();
    // String name = await ImageUploadUtils.getPBName(pbType);
    setState(() {
      _title = '图片上传 - $name';
    });
  }

  void _parseAsset() async {
    // if (widget.assets != null && widget.assets.isNotEmpty) {
    //   files = [];
    //   filesName = [];
    //   File tmp;
    //
    //   /// 将Assets文件转换成File
    //   for (int i = 0; i < widget.assets.length; i++) {
    //     tmp = await widget.assets[i].originFile;
    //     files.add(tmp);
    //     filesName.add(path.basename(tmp.path));
    //   }
    //
    //   var sp = await SpUtil.getInstance();
    //
    //   var settingIsTimestampRename =
    //       sp.getBool(SharedPreferencesKeys.settingIsTimestampRename) ?? false;
    //
    //   if (settingIsTimestampRename) {
    //     int timestamp = new DateTime.now().millisecondsSinceEpoch;
    //
    //     /// 处理时间戳命名
    //     for (int i = 0; i < widget.assets.length; i++) {
    //       /// 获取图片名
    //       String suffix = path.extension(tmp.path);
    //
    //       /// replace
    //       filesName[i] = '${timestamp + i}$suffix';
    //     }
    //   }
    //   var settingIsUploadedRename =
    //       sp.getBool(SharedPreferencesKeys.settingIsUploadedRename) ?? false;
    //
    //   if (settingIsUploadedRename) {
    //     String content = filesName.join('\n');
    //
    //     /// 处理默认文本内容
    //     _controller.text = content;
    //
    //     /// 处理重命名
    //     await showDialog(
    //       context: context,
    //       barrierDismissible: false,
    //       builder: (context) {
    //         return AlertDialog(
    //           title: const Center(
    //             child: Text('重命名图片，多张图片时以换行符分隔'),
    //           ),
    //           content: Container(
    //             padding: const EdgeInsets.only(left: 4, right: 4),
    //             child: TextField(
    //               textInputAction: TextInputAction.newline,
    //               controller: _controller,
    //               scrollPadding: EdgeInsets.zero,
    //               maxLines: null,
    //             ),
    //           ),
    //           actions: <Widget>[
    //             TextButton(
    //                 child: const Text('确定'),
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                   _handleTextFieldContent(_controller.text.trim());
    //                 }),
    //           ],
    //         );
    //       },
    //     );
    //   } else {
    //     _parseAssetsSuccess();
    //   }
    // } else {
    //   Navigator.pop(context);
    // }
  }

  // _handleTextFieldContent(String content) {
  //   List<String> splits = content.split('\n');
  //   if (splits != null && splits.length >= widget.assets.length) {
  //     /// 处理内容是否正确
  //     for (int i = 0; i < widget.assets.length; i++) {
  //       if (splits[i].isNotEmpty) {
  //         /// 不为空，则再覆盖
  //         filesName[i] = splits[i];
  //       }
  //     }
  //   }
  //   _parseAssetsSuccess();
  // }

  _parseAssetsSuccess() {
    setState(() {
      isParse = true;
    });
  }
}
