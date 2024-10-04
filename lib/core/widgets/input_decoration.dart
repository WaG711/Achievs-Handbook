import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration buildInputDecoration(String text) {
    return InputDecoration(
      labelText: text,
      labelStyle: const TextStyle(color: Colors.white),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
    );
  }
}