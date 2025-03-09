import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void customSnackBar({
  required BuildContext context,
  required String content,
  required Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(content),
    ),
  );
}
