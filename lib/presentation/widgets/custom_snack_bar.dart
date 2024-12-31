import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(
      BuildContext context, {
        required String message,
        String? actionLabel,
        VoidCallback? onActionPressed,
        Color backgroundColor = Colors.black87,
        Color textColor = Colors.white,
        Color actionColor = Colors.blueAccent,
        Duration duration = const Duration(seconds: 3),
        SnackBarBehavior behavior = SnackBarBehavior.floating,
        EdgeInsetsGeometry? margin,
      }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      action: actionLabel != null
          ? SnackBarAction(
        label: actionLabel,
        onPressed: onActionPressed ?? () {},
        textColor: actionColor,
      )
          : null,
      backgroundColor: backgroundColor,
      behavior: behavior,
      duration: duration,
      margin: margin,
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar() // Ensures only one Snackbar is visible
      ..showSnackBar(snackBar);
  }
}
