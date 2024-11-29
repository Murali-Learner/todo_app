import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/constants.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/ui/screens/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
            primary: AppColors.primaryColor,
            surface: AppColors.backgroundColor,
          ),
          scaffoldBackgroundColor: AppColors.backgroundColor,
          appBarTheme: const AppBarTheme(
            color: AppColors.primaryColor,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          cardTheme: CardTheme(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const TodoListScreen(),
      ),
    );
  }
}
