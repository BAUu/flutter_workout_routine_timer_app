import 'package:flutter/material.dart';
import 'package:workout_routine_timer_app/presentation/screen/start_workout_screen.dart';
import 'package:workout_routine_timer_app/presentation/screen/main_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    // 첫 번째 스크린
    GoRoute(
      path: '/',
      builder: (context, state) =>  MainScreen(),
    ),
    // 두 번째 스크린
    GoRoute(
      path: '/alim',
      builder: (context, state) => StartWorkOutScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'WorkOut Routine Timer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
    );
  }
}
