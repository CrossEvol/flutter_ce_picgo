import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/utils/dir_util.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLogger();
  await setupAppDirectory();

  runApp(const MaterialApp(
    home: UrlLaunchPage(),
  ));
}

class UrlLaunchPage extends StatefulWidget {
  const UrlLaunchPage({super.key});

  @override
  State<UrlLaunchPage> createState() => _UrlLaunchPageState();
}

class _UrlLaunchPageState extends State<UrlLaunchPage> {
  _UrlLaunchPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UrlLaunchPage'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await openDocument('C:/Users/mizuk/Documents/github');
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.purpleAccent)),
                child: const Text('Open In Windows')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  await openDocument(appStorageDirectory);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.greenAccent)),
                child: const Text('Open In Android')),
          ],
        )));
  }

  Future<void> openDocument(String filePath) async {
    final url = 'file:///$filePath';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      // Handle the case where no app can open the file
    }
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
