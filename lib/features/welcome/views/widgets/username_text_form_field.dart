import 'package:flutter/material.dart';

class UserNameTextFormField extends StatelessWidget {
  const UserNameTextFormField({
    super.key,
    required this.autovalidateMode,
    required this.onValueSaved,
  });
  final ValueChanged<String> onValueSaved;
  final AutovalidateMode autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        } else if (value.length < 3) {
          return 'username must be at least 3 characters';
        }
        return null;
      },
      onSaved: (newValue) {
        onValueSaved(newValue!);
      },
      keyboardType: TextInputType.text,
      cursorColor: const Color(0xFF00FFCB),
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF1C2341),
          label: const Text('name'),
          labelStyle: const TextStyle(color: Colors.white),
          hintText: 'Enter your name',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: customOutlineBorder(),
          enabledBorder: customOutlineBorder(),
          focusedBorder: customOutlineBorder(),
          errorBorder: customOutlineBorder(borderColor: Colors.red),
          focusedErrorBorder: customOutlineBorder(borderColor: Colors.red)),
    );
  }

  OutlineInputBorder customOutlineBorder({Color? borderColor}) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: borderColor ?? const Color(0xFF00FFCB)));
  }
}
