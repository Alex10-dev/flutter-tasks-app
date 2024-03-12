
import 'package:flutter/material.dart';
import 'package:task_app/presentation/widgets/widgets.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.secondaryContainer,
        body: CustomScrollList(
          title: 'Detalles de tarea',
          sliverBody: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const Column(
                  children: <Widget>[
                    
                    TaskInfoContainer(
                      title: 'Por hacer',
                      titleCount: '3/8',
                      child: _TodosInfo(),
                    ),
                
                  ],
                );
              },
              childCount: 1
            )
          ),
        ),
      ),
    );
  }
}

class _TodosInfo extends StatelessWidget {
  const _TodosInfo();

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Column(
      children: [
                    
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomCircularProgress(
            progressColor: colorScheme.primary,
            percent: 30,
            size: 140,
            text: '3/8',
            strokeWidth: 22,
            textStyle: textStyle.headlineLarge!.copyWith(color: colorScheme.primary),
          ),
        ),
                    
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return TodoItem(
              isCompleted: true,
              index: index,
            );
          },
        ),
      ],
    );
  }
}

