import 'package:flutter/material.dart';
import 'package:task_app/config/theme/app_theme.dart';
import 'package:task_app/presentation/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks App',
      theme: AppTheme().get(),
      home: const TasksScreen(),
    );
  }
}