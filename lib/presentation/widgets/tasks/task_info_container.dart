import 'package:flutter/material.dart';

class TaskInfoContainer extends StatelessWidget {

  final Widget child;
  final String title;
  final String? titleCount;

  const TaskInfoContainer({
    super.key,
    required this.child, 
    required this.title, 
    this.titleCount,
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final TextTheme textStyle = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title, 
                  style: textStyle.titleLarge!.copyWith(fontSize: 18, color: colorScheme.outline)
                ),
                if( titleCount != null)
                  Text(
                    titleCount!, 
                    style: textStyle.titleLarge!.copyWith(fontSize: 18, color: colorScheme.outline)
                  )
              ],
            ),
          ),
          const SizedBox(height: 12,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorScheme.onSecondary, 
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: colorScheme.outlineVariant,
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  color: colorScheme.shadow.withOpacity(0.1),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 8,
                  offset: const Offset(0, 6)
                )
              ]
            ),
            child: child
          ),
        ],
      ),
    );
  }
}