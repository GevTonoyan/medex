import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/translations/messages.dart';
import 'package:medex/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: const Locale('en', 'EN'),
      home: MaterialApp(
        title: 'Մեդեքս  ',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
