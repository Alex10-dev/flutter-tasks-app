import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {

  final Widget child;

  const BackgroundGradient({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: const [0.3, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colorScheme.primary, colorScheme.onPrimaryContainer]
        )
      ),
      child: child,
    );
  }
}