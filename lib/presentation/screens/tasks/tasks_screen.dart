import 'package:flutter/material.dart';
import 'package:task_app/presentation/widgets/shared/custom_bottom_navbar.dart';
import 'package:task_app/presentation/widgets/widgets.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        body: CustomScrollList(
          sliverBody: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              
              return Container( 
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: Colors.red, child: Text('$index')
              );
            },
            childCount: 100,
            )), 
          ),
        bottomNavigationBar: const CustomBottomNavbar(),
      ),
    );
  }
}


