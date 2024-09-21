import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyApp'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    fToast.showSuccessToast(text: 'Success');
                  },
                  child: const Text('Display success toast')),
              ElevatedButton(
                  onPressed: () {
                    fToast.showErrorToast(text: 'Error');
                  },
                  child: const Text('Display error toast')),
            ],
          ),
        ));
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
