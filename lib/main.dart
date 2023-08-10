import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/translations/messages.dart';
import 'package:medex/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: const Locale('hy', 'AM'),
      fallbackLocale: const Locale('ru', 'Ru'),
      home: MaterialApp(
        title: 'title'.tr,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
