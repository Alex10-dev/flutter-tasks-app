import 'package:flutter/material.dart';
import 'package:task_app/presentation/widgets/background_waves.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform(
        transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
        alignment: Alignment.center,
        child: const BackgroundWaves(),
      ),
    );
  }
}