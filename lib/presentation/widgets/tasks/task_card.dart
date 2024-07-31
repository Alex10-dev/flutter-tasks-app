
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/domain/entities/entitites.dart';
import 'package:task_app/presentation/widgets/widgets.dart';

class TaskCard extends StatelessWidget {

  final int index;
  final Task task;

  const TaskCard({
    super.key, 
    required this.index, 
    required this.task
  });

  String getTaskProgress( Task task ) {
    return '${ task.todos.length.toString() }/${task.todos.length}';
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Container( 
      margin: const EdgeInsets.only(bottom: 22),
      decoration: BoxDecoration(
        color: colorScheme.surface, 
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outlineVariant,
          width: 1,
          strokeAlign: BorderSide.strokeAlignCenter
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            color: colorScheme.shadow.withOpacity(0.1),
            blurStyle: BlurStyle.normal,
            blurRadius: 10,
            offset: const Offset(0, 4)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: CustomCircularProgress(
                      size: 90,
                      percent: 70, 
                      circleBackground: colorScheme.primaryContainer,
                      progressColor: colorScheme.primary,
                      strokeWidth: 13,
                      text: getTaskProgress(task),
                      textStyle: textStyles.labelLarge!.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold),
                    )
                  ),
                  const SizedBox(width: 14),
                  _BasicInfoTask(
                    textStyles: textStyles, 
                    colorScheme: colorScheme, 
                    title: task.title,
                    createdBy: task.createdBy.toString(),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(
                    text: 'GO!  ',
                    textColor1: colorScheme.primary,
                    textColor2: colorScheme.onPrimaryContainer,
                    hasIcon: true,
                    onTap: () {
                      GoRouter.of(context).push('/home/details');
                    },
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}



class _BasicInfoTask extends StatelessWidget {

  final String title;
  final String createdBy;

  final TextTheme textStyles;
  final ColorScheme colorScheme;

  const _BasicInfoTask({
    required this.textStyles,
    required this.colorScheme, 
    required this.title, 
    required this.createdBy,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title, 
              style: textStyles.titleMedium!.copyWith(fontSize: 18, height: 1.2), 
              maxLines: 2, 
              overflow: TextOverflow.ellipsis 
            ),
            const SizedBox(height: 6,),
            Text(
              'Creado por: $createdBy',
              style: textStyles.bodySmall!.copyWith(color: colorScheme.outline),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Desde: 10/01/2024',
              style: textStyles.bodySmall!.copyWith(color: colorScheme.outline),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}