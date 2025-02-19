import 'package:flutter/material.dart';
import 'package:hotel_search_app/screens/home_screen.dart';
import 'package:hotel_search_app/utils/color_values.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: ColorValues.white2,
          appBarTheme: AppBarTheme(
              scrolledUnderElevation: 0, backgroundColor: ColorValues.white1)),
      home: HomeScreen(),
    );
  }
}
