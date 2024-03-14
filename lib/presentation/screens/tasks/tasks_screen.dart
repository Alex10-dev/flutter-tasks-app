import 'package:flutter/material.dart';
import 'package:task_app/presentation/widgets/widgets.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return  SafeArea(
      child: CustomScaffold(
        fab: FloatingActionButton(
          backgroundColor: colorScheme.primary,
          shape: const CircleBorder(),
          isExtended: false, 
          onPressed: () {
            
          },
          tooltip: 'Add',
          child: Icon(Icons.add_outlined, size: 32, color: colorScheme.onPrimary,),
        ),
        child: CustomScrollList(
          verticalPadding: 16,
          horizontalPadding: 16,
          title: 'Tareas asignadas',
          sliverBody: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if( index == 10) {
                  return const SizedBox(height: 60);
                } 
                return SlideAnimation(
                  child: TaskCard(index: index)
                );
              },
            childCount: 10 + 1,
            )
          ), 
        ),
      )
    );
  }
}


