
import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 60,
      width: double.infinity,
      child: BottomAppBar(
        padding: const EdgeInsets.all(0),
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(), // Crea la muesca para el FloatingActionButton
        notchMargin: 10.0, // El margen alrededor de la muesca
        color: colorScheme.primaryContainer, // El color del BottomAppBar
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: _ButtonAppBar(
                icon: const Icon(Icons.menu),
                iconColor: colorScheme.onSurface,
                onPressed: (){},
                iconSize: 30,
              ),
            ),
            // Botón central simulado, no se moverá con el teclado
            const SizedBox(width: 80),
            Expanded(
              child: _ButtonAppBar(
                icon: const Icon(Icons.menu),
                iconColor: colorScheme.onSurface,
                onPressed: (){},
                iconSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonAppBar extends StatelessWidget {

  final VoidCallback onPressed;
  final Color iconColor;
  final double iconSize;
  final Icon icon;

  const _ButtonAppBar({
    required this.onPressed,
    required this.iconColor, 
    required this.iconSize, 
    required this.icon, 
  });

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        style: IconButton.styleFrom(
          iconSize: iconSize,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        icon: icon,
        onPressed: () {
        },
      ),
    );
  }
}