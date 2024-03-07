
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {

  final int index;

  const TaskCard({
    super.key, 
    required this.index
  });

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
                  const Align(
                    alignment: Alignment.topCenter,
                    child: CustomProgressCircular()
                  ),
                  const SizedBox(width: 14),
                  _BasicInfoTask(textStyles: textStyles, colorScheme: colorScheme)
                ],
              ),
                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('prueba');
                    },
                    child: Row(
                      children: [
                        Text('VER', style: textStyles.bodyMedium!.copyWith(color: colorScheme.primary)),
                        Icon(Icons.arrow_forward_ios_outlined, size: 16, color: colorScheme.primary)
                      ],
                    ),
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
  const _BasicInfoTask({
    required this.textStyles,
    required this.colorScheme,
  });

  final TextTheme textStyles;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Titulo de la nueva tarea para pruebas', 
            style: textStyles.titleMedium!.copyWith(fontSize: 18, height: 1.2), 
            maxLines: 2, 
            overflow: TextOverflow.ellipsis 
          ),
          const SizedBox(height: 6,),
          Text(
            'Creado por: Alexis Orozco Hernandez',
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
    );
  }
}

class CustomProgressCircular extends StatelessWidget {
  const CustomProgressCircular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.black12
      ), 
    );
  }
}