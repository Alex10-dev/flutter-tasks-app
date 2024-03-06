import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  final Function validationFunction;
  final String label;
  final InputDecoration? decoration;
  final bool? hideInput;
  final Icon? inputIcon;
  final Color? inputIconColor;
  

  const InputText({
    super.key, 
    required this.validationFunction, 
    required this.label,
    this.hideInput = false,
    this.decoration, 
    this.inputIcon, 
    this.inputIconColor,
  });

  @override
  Widget build(BuildContext context) {

    final defaultDecoration = InputDecoration(
      prefixIcon: inputIcon,
      prefixIconColor: inputIconColor,
      helperText: '',
      helperMaxLines: 1,
      helperStyle: const TextStyle(height: 0.3),
      errorMaxLines: 1,
      errorStyle: const TextStyle(height: 0.3),
      errorText: null,
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      )
    );

    return TextFormField(
      obscureText: hideInput!,
      textAlignVertical: TextAlignVertical.top,
      decoration: ( decoration == null ) ? defaultDecoration : decoration,
      validator: (value) {
        return validationFunction(value);
      },
    );
  }
}