import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FToast fToast = FToast();

extension FlutterToastExtension on FToast {
  void showSuccessToast({required String text}) {
    Widget toast =
        createToastWidget(text: text, toastState: ToastState.success);

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  void showErrorToast({required String text}) {
    Widget toast = createToastWidget(text: text, toastState: ToastState.error);

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}

Widget createToastWidget(
    {required String text, required ToastState toastState}) {
  if (text.length > 30) {
    log(text);
    text = text.substring(0, 30);
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: switch (toastState) {
        ToastState.success => Colors.greenAccent,
        ToastState.error => Colors.redAccent,
      },
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        switch (toastState) {
          ToastState.success => const Icon(Icons.check),
          ToastState.error => const Icon(Icons.close),
        },
        const SizedBox(
          width: 12.0,
        ),
        Text(text),
      ],
    ),
  );
}

enum ToastState { success, error }
