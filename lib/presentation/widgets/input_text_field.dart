import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  final Function onChange;
  final Function validationFunction;
  final String label;
  final InputDecoration? decoration;
  final bool? hideInput;
  final Icon? inputIcon;
  final Color? inputIconColor;
  

  const InputText({
    super.key, 
    required this.onChange,
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
      helperStyle: const TextStyle(height: 1),
      errorMaxLines: 2,
      errorStyle: const TextStyle(height: 1, overflow: TextOverflow.ellipsis),
      errorText: null,
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      )
    );

    return TextFormField(
      onChanged: (value) => onChange( value ),
      obscureText: hideInput!,
      textAlignVertical: TextAlignVertical.top,
      decoration: ( decoration == null ) ? defaultDecoration : decoration,
      validator: (value) {
        return validationFunction(value);
      },
    );
  }
}