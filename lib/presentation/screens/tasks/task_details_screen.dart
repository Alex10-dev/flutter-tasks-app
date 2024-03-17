
import 'package:flutter/material.dart';
import 'package:task_app/presentation/widgets/widgets.dart';

class TaskDetailsScreen extends StatelessWidget {

  static const String name = 'task-details-screen';

  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: CustomScaffold(
        fab: FloatingActionButton(
          backgroundColor: colorScheme.primary,
          shape: const CircleBorder(),
          isExtended: false, 
          onPressed: () {
            
          },
          tooltip: 'Add',
          child: Icon(Icons.search, size: 32, color: colorScheme.onPrimary,),
        ),
        child: CustomScrollList(
          title: 'Detalles de tarea',
          sliverBody: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: <Widget>[
        
                    const SizedBox(height: 20),
        
                    TaskInfoContainer(
                      title: 'Descripción',
                      child:  _TaskDescription(
                        description: 'La siguiente tarea esta asignada por un usuario de la aplicaión, deben de realizarse las actividades indicadas.',
                        createdBy: 'Alexis Leonel Orozco Hernandez',
                        createdDate: '24/01/2024',
                        colorScheme: colorScheme
                      ),
                    ),

                    const SizedBox(height: 40),

                    const TaskInfoContainer(
                      title: 'Por hacer',
                      titleCount: '3/8',
                      child: _TodosInfo(),
                    ),
        
                    const SizedBox(height: 100),
                
                  ],
                );
              },
              childCount: 1
            )
          ),
        ),
      )
    );
  }
}

class _TaskDescription extends StatelessWidget {

  final String description;
  final String createdBy;
  final String createdDate;
  final ColorScheme colorScheme;

  const _TaskDescription({
    required this.colorScheme, 
    required this.description, 
    required this.createdBy, 
    required this.createdDate,
  });

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 10),
      child: Column(
        children: <Widget>[
      
          Text(description, style: textStyle.bodyMedium),
          
          const SizedBox(height: 20),
      
          Divider(
            color: colorScheme.outlineVariant,
            height: 10,
          ),
          
          SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Creado por:', style: textStyle.bodyMedium!.copyWith( color: colorScheme.outline, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold )),
                      Text(createdBy, style: textStyle.bodyMedium!.copyWith( color: colorScheme.outline, fontStyle: FontStyle.italic ), maxLines: 1, overflow: TextOverflow.ellipsis,)
                    ],
                  )
                ),
      
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Desde:', style: textStyle.bodyMedium!.copyWith( color: colorScheme.outline, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold )),
                    Text(createdDate, style: textStyle.bodyMedium!.copyWith( color: colorScheme.outline, fontStyle: FontStyle.italic ), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                )
              ],
            ),
          )
        ],
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
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: CustomCircularProgress(
            circleBackground: colorScheme.primaryContainer,
            progressColor: colorScheme.primary,
            percent: 30,
            size: 140,
            text: '3/8',
            strokeWidth: 22,
            textStyle: textStyle.headlineLarge!.copyWith(color: colorScheme.primary),
          ),
        ),
                    
        Container(
          color: Colors.blue,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return TodoItem(
                isCompleted: true,
                index: index,
              );
            },
          ),
        ),
    
        AddTodoButton(
          hintText: 'Añadir actividad...', 
          onSubmit: (String input) {
          }, 
        )
    
      ],
    );
  }
}



