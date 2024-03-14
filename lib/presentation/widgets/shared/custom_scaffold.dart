import 'package:flutter/material.dart';
import 'package:task_app/presentation/widgets/widgets.dart';

class CustomScaffold extends StatelessWidget {

  final Widget child;
  final Widget? fab;
  const CustomScaffold({
    super.key, 
    required this.child, 
    this.fab
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return  SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: colorScheme.secondaryContainer,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: fab,
        bottomNavigationBar: const CustomBottomNavbar(),
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(padding: const EdgeInsets.symmetric(vertical: 0)),
          child: child
        ),
        
      ),
    );
  }
}


