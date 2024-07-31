import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/presentation/providers/auth/auth_provider.dart';
import 'package:task_app/presentation/providers/tasks/tasks_providers.dart';
import 'package:task_app/presentation/widgets/widgets.dart';

class TasksScreen extends StatelessWidget {

  static const String name = 'tasks-screen';

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
        child: const _TasksView(),
      )
    );
  }
}

class _TasksView extends ConsumerStatefulWidget {
  const _TasksView();

  @override
  _TasksViewState createState() => _TasksViewState();
}

class _TasksViewState extends ConsumerState<_TasksView> {

  @override
  void initState() {
    super.initState();

    
    ref.read( tasksProvider.notifier ).loadNextPage(ref.read( authProvider.notifier ).getToken);
  }

  @override
  Widget build(BuildContext context) {

    final allTasks = ref.watch( tasksProvider );

    return CustomScrollList(
      verticalPadding: 16,
      horizontalPadding: 16,
      title: 'Tareas asignadas',
      sliverBody: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if( index == allTasks.length) {
              return const SizedBox(height: 60);
            } 
            return SlideAnimation(
              child: TaskCard(index: index, task: allTasks[index])
            );
          },
        childCount: allTasks.length + 1,
        )
      ), 
    );
  }
}


