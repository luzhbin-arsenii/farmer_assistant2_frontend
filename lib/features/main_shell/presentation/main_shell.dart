import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  int _getIndex(String location){
    if (location.startsWith('/news')) return 0;
    if (location.startsWith('/tasks')) return 1;
    if (location.startsWith('/scanner')) return 2;
    if (location.startsWith('/settings')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location=GoRouterState.of(context).uri.toString();
    final currentIndex=_getIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/news');
              break;
            case 1:
              context.go('/tasks');
              break;
            case 2:
              context.go('/scanner');
              break;
            case 3:
              context.go('/settings');
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.article),
            label: 'Новости',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_circle),
            label: 'Задачи',
          ),
          NavigationDestination(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Сканер',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          )
        ],
        shadowColor: Colors.white,
        surfaceTintColor: Colors.blue,
        elevation: 8,
      )
    );
  }
}