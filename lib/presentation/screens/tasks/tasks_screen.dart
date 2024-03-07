import 'package:flutter/material.dart';
import 'package:task_app/presentation/widgets/shared/custom_bottom_navbar.dart';
import 'package:task_app/presentation/widgets/widgets.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return  SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.secondaryContainer,
        body: CustomScrollList(
          sliverBody: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return TaskCard(index: index);
            },
            childCount: 100,
            )), 
          ),
        bottomNavigationBar: const CustomBottomNavbar(),
      ),
    );
  }
}


