import 'package:flutter/material.dart';
import 'package:socialapp/view/widget/widgets.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Function onPressed;
  final Color color;

  const CustomButton({
    this.text = '',
    this.borderRadius = 0,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontWeight: FontWeight.w600,
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
