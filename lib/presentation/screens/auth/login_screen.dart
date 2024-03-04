import 'package:flutter/material.dart';
import 'package:task_app/presentation/widgets/background_waves.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundWaves(),
    );
  }
}