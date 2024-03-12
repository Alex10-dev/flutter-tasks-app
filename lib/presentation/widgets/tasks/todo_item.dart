import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final int index;
  final bool isCompleted;

  const TodoItem({
    super.key,
    required this.index,
    required this.isCompleted,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-0.5, 0.0), // Ajusta la cantidad de deslizamiento
    ).animate(_animationController);

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0, // Ajusta la opacidad de los botones
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textStyle = Theme.of(context).textTheme;

    double screenWidth = MediaQuery.of(context).size.width;

    final boxDecoration = BoxDecoration(
      color: colorScheme.surface,
      border: Border(
        bottom: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.6), width: 1.0),
        top: (widget.index == 0)
            ? BorderSide(color: colorScheme.outlineVariant.withOpacity(0.6), width: 1.0)
            : BorderSide.none,
      ),
    );

    void onDragItem( DragUpdateDetails details ){
      // Incrementa la animación basada en el gesto del usuario
      double delta = details.primaryDelta! / 300; // Ajusta la sensibilidad
      _animationController.value -= delta;
    }

    void dragEndAnimation(){
      // Completa o revierte la animación basada en cómo de lejos fue deslizado el item
      if (_animationController.value >= 0.5) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }

    return GestureDetector(
      onHorizontalDragUpdate: (details) => onDragItem(details),
      onHorizontalDragEnd: (details) => dragEndAnimation(),
      child: Stack(
        children: [
          Positioned.fill(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _Button(
                    width: screenWidth * 0.25, 
                    buttonColor: Colors.blue,
                    text: 'Editar',
                    onPressed: () {},
                  ),
                  _Button(
                    width: screenWidth * 0.25, 
                    buttonColor: colorScheme.tertiary, 
                    text: 'Eliminar',
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),

          SlideTransition(
            position: _slideAnimation,
            child: _TodoInfo(
              isCompleted: true,
              text: 'Texto de prueba de informacion de todo list para el usuario',
              boxDecoration: boxDecoration, 
              colorScheme: colorScheme, 
              textStyle: textStyle
            ),
          ),
        ],
      ),
    );
  }
}

class _TodoInfo extends StatelessWidget {

  final bool isCompleted;
  final String text;
  final BoxDecoration boxDecoration;
  final ColorScheme colorScheme;
  final TextTheme textStyle;

  const _TodoInfo({
    required this.isCompleted,
    required this.text,
    required this.boxDecoration,
    required this.colorScheme,
    required this.textStyle,  
  });  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: boxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isCompleted
            ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
                child: Icon(Icons.check_box_outlined, size: 30, color: Colors.green.shade600)
              )
            : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Icon(Icons.check_box_outline_blank_rounded, size: 30, color: colorScheme.tertiary),
            ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                text,
                style: textStyle.bodyMedium!.copyWith(color: colorScheme.onSecondaryContainer, height: 1.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {

  final double width;
  final Color buttonColor;
  final String text;
  final VoidCallback onPressed;

  const _Button({
    required this.width,
    required this.buttonColor, 
    required this.text, 
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor, // Color de fondo del botón
          shape: const RoundedRectangleBorder( // Esto asegura que el botón sea completamente cuadrado
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}