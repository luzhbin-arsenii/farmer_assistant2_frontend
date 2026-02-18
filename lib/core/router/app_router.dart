import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/main_shell/presentation/main_shell.dart';
import '../../features/news/presentation/news_page.dart';
import '../../features/scanner/presentation/scanner_page.dart';
import '../../features/settings/presentation/settings_page.dart';
import '../../features/tasks/presentation/tasks_page.dart';

final GoRouter router= GoRouter(
    initialLocation: '/news',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
              path: '/news',
              builder: (context, state) => const NewsPage(),
          ),
          GoRoute(
              path: '/tasks',
              builder: (context, state) => const TasksPage(),
          ),
          GoRoute(
              path: '/scanner',
              builder: (context, state) => const ScannerPage(),
          ),
          GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsPage(),
          )
        ]
      )
    ]
);