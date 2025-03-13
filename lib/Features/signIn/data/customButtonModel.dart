import 'dart:ui';

class Custombuttonmodel {
  final String text;
  final Size? minimumSize;
  final void Function()? onPressed;

  Custombuttonmodel({
    required this.text,
    this.minimumSize,
    required this.onPressed,
  });
}
