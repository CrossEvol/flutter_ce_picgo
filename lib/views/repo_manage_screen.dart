import 'package:flutter/material.dart';

class RepoManageScreen extends StatefulWidget {
  final String storageType;

  const RepoManageScreen({super.key, required this.storageType});

  @override
  State<RepoManageScreen> createState() => _RepoManageScreenState();
}

class _RepoManageScreenState extends State<RepoManageScreen> {
  _RepoManageScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RepoManageScreen'),
        ),
        body: Text(widget.storageType));
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
