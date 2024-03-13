import 'package:flutter/material.dart';

class AddTodoButton extends StatelessWidget {

  final String hintText;
  final Function(String) onSubmit;

  const AddTodoButton({
    super.key, 
    required this.hintText, 
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 4, bottom: 6),
      alignment: Alignment.topCenter,
      child: TextField(
        textInputAction: TextInputAction.done,
        onSubmitted: onSubmit,
        style: const TextStyle(height: 1),
        maxLines: null,
        minLines: 1,
        textAlign: TextAlign.start, // Centra el texto dentro del TextField
        decoration: InputDecoration(
          hintText: hintText, // Texto que se muestra cuando el TextField está vacío
          border: InputBorder.none, // Puedes ajustar esto para eliminar el borde si lo deseas
        ),
      )
    );
  }
}