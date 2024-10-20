import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/core/translations/messages.dart';
import 'package:medex/core/di/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medex/ui/admin/views/admin_screen.dart';
import 'package:medex/core/utils/configuration.dart';
import 'package:medex/ui/home/home_screen_desktop.dart';
import 'package:medex/ui/home/home_screen_mobile.dart';
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
      initialRoute: '/',
      routes: <String, Widget Function(BuildContext context)>{
        '/admin': (_) => const AdminScreen(),
      },
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: const Locale('hy', 'AM'),
      fallbackLocale: const Locale('ru', 'Ru'),
      theme: ThemeData(fontFamily: 'Mardoto'),
      home: MaterialApp(
        title: 'Medex',
        theme: ThemeData(useMaterial3: true),
        home: Configuration().isMobile
            ? const HomeScreenMobile()
            : const HomeScreenDesktop(),
      ),
    );
  }
}
