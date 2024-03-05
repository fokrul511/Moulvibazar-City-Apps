import 'package:clg_final_projects/presentation/screens/home_screen.dart';
import 'package:clg_final_projects/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green.shade700,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonColor,
            padding: EdgeInsets.symmetric(vertical: 15),
            textStyle: TextStyle(
              fontSize: 18,

            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
