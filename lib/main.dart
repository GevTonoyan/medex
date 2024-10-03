import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/core/routes.dart';
import 'package:medex/di/dependency_injection.dart';
import 'package:medex/translations/messages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medex/utils/configuration.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Configuration().screenSize = MediaQuery.sizeOf(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: const Locale('hy', 'AM'),
      fallbackLocale: const Locale('ru', 'Ru'),
      home: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'title'.tr,
        theme: ThemeData(useMaterial3: true),
      ),
    );
  }
}
