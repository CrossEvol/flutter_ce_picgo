import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FToast fToast = FToast();

void main() {
  runApp(MaterialApp(
    builder: FToastBuilder(),
    home: const MyApp(),
  ));
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
      body: ElevatedButton(
        onPressed: () {
          fToast.removeQueuedCustomToasts();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MySecondApp()));
        },
        child: const Text('Second'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showToast();
        },
        child: const Icon(Icons.ac_unit),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 16.0,
            left: 16.0,
            child: child,
          );
        });
  }
}

class MySecondApp extends StatefulWidget {
  const MySecondApp({super.key});

  @override
  State<MySecondApp> createState() => _MySecondAppState();
}

class _MySecondAppState extends State<MySecondApp> {
  _MySecondAppState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MySecondApp'),
      ),
      body: ElevatedButton(
        onPressed: () {
          fToast.removeQueuedCustomToasts();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const MyApp()));
        },
        child: const Text('FirstApp'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showToast();
        },
        child: const Icon(Icons.ac_unit),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  @override
  void dispose() {
    fToast.removeQueuedCustomToasts();
    super.dispose();
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 16.0,
            left: 16.0,
            child: child,
          );
        });
  }
}
