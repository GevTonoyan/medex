import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medex/ui/admin/admin_screen.dart';
import 'package:medex/ui/home/home_screen_desktop.dart';
import 'package:medex/ui/home/home_screen_mobile.dart';
import 'package:medex/utils/configuration.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return Configuration().isMobile
            ? const HomeScreenMobile()
            : const HomeScreenDesktop();
      },
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) {
        return const AdminScreen();
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );
  },
);
