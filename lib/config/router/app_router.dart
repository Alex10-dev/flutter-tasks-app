
import 'package:go_router/go_router.dart';
import 'package:task_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    
    GoRoute(
      path: '/home',
      name: TasksScreen.name,
      builder: (context, state) => const TasksScreen(),
      routes: [
        GoRoute(
          path: 'details',
          name: TaskDetailsScreen.name,
          builder: (context, state) => const TaskDetailsScreen(),
        ),
      ]
    ),

    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    )
  ]
);