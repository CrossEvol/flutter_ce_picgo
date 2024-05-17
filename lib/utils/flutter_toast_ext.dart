import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FToast fToast = FToast();

extension FlutterToastExtension on FToast {
  void showSuccessToast({required String text, int duration = 2}) {
    Widget toast =
        createToastWidget(text: text, toastState: ToastState.success);

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: duration),
    );
  }

  void showErrorToast({required String text, int duration = 2}) {
    Widget toast = createToastWidget(text: text, toastState: ToastState.error);

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: duration),
    );
  }
}

Widget createToastWidget(
    {required String text, required ToastState toastState}) {
  if (text.length > 30) {
    logger.e(text);
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
