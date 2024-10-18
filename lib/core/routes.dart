import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medex/ui/admin/admin_screen.dart';
import 'package:medex/ui/home/home_screen_desktop.dart';
import 'package:medex/ui/home/home_screen_mobile.dart';
import 'package:medex/ui/news/news_detail_screen.dart';
import 'package:medex/ui/news/news_item_model.dart';
import 'package:medex/core/utils/configuration.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return Configuration().isMobile
            ? const HomeScreenMobile()
            : const HomeScreenDesktop();
      },
      routes: [
        GoRoute(
          path: 'news_detail:title',
          builder: (context, state) {
            return NewsDetailScreen(
              newsItemModel: NewsItemModel(
                title: 'title',
                description: 'description',
                imageUrl: 'imageUrl',
                date: 'date',
              ),
            );
          },
        ),
      ],
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
