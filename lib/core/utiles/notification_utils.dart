import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class NotificationUtils {
  static OverlaySupportEntry? loading;
  static showSuccessMessage(String message) {
    showSimpleNotification(
        Text(
          message,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        background: Colors.green,
        position: NotificationPosition.bottom);
  }

  static showErrorMessage(String message) {
    showSimpleNotification(
        Text(
          message,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        background: Colors.red,
        position: NotificationPosition.bottom);
  }

  static showLoading() {
    loading = showOverlayNotification(
          (c) {
        return SizedBox(
          height: MediaQuery.of(c).size.height,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      duration: const Duration(seconds: 0),
    );
  }

  static hideLoading() {
    loading?.dismiss();
  }
}
