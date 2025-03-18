import 'dart:ui';

class Custombuttonmodel {
  final String text;
  final Size? minimumSize;
  final void Function()? onPressed;
  final Color? backgroundColor;

  Custombuttonmodel({
    this.backgroundColor,
    required this.text,
    this.minimumSize,
    required this.onPressed,
  });
}
