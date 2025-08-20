import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Notifier {
  static Future<void> showToast(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Color? textColor,
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) async {
    final platform = defaultTargetPlatform;

    if (platform == TargetPlatform.android || platform == TargetPlatform.iOS) {
      try {
        await Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: gravity,
          backgroundColor: backgroundColor,
          textColor: textColor,
        );
        return;
      } catch (_) {
        // Fall through to SnackBar
      }
    }

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: textColor ?? Colors.white),
          ),
          backgroundColor: backgroundColor ?? Colors.black87,
        ),
      );
    }
  }
}

