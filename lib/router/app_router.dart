import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/activity_list_screen.dart';
import '../screens/activity_detail_screen.dart'; // Pastikan sudah di-import
import '../screens/add_edit_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/profile_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/':
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/activity-list':
        return MaterialPageRoute(builder: (_) => const ActivityListScreen());
      case '/activity-detail':
        return MaterialPageRoute(builder: (_) => const ActivityDetailScreen(), settings: settings);
      case '/add-edit':
        return MaterialPageRoute(builder: (_) => const AddEditScreen(), settings: settings);
      case '/favorites':
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Halaman tidak ditemukan: ${settings.name}'),
            ),
          ),
        );
    }
  }
}