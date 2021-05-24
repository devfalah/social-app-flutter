import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function validator;
  final Function onSaved;

  const CustomTextFormField({
    this.hintText,
    this.iconData,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        hintText: hintText,
        prefixIcon: Icon(
          iconData,
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
