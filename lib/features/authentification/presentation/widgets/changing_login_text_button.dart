import 'package:flutter/material.dart';

class ChangingLoginTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String labelText;

  const ChangingLoginTextButton({super.key, required this.labelText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          labelText,
          style: TextStyle(color: Colors.grey[350], fontSize: 16),
        ));
  }
}
