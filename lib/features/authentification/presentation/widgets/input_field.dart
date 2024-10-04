import 'package:flutter/material.dart';

import '../../../../core/widgets/input_decoration.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String> onChanged;

  const InputField({
    super.key,
    required this.labelText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.green,
      style: const TextStyle(color: Colors.white),
      decoration: CustomInputDecoration.buildInputDecoration(labelText),
      onChanged: onChanged,
    );
  }
}
