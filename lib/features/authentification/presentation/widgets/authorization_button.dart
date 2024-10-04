import 'package:flutter/material.dart';

class AuthorizationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String labelText;

  const AuthorizationButton({super.key, required this.labelText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: onPressed,
      child: Text(
        labelText,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
