import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/settings_screen.dart';
import 'services/local_storage.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await NotificationService().init();
  runApp(MyApp());
}

class AppState extends ChangeNotifier {
  bool _loggedIn = false;
  String? _userEmail;

  bool get loggedIn => _loggedIn;
  String? get userEmail => _userEmail;

  void login(String email) {
    _loggedIn = true;
    _userEmail = email;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    _userEmail = null;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Capstone Recipe App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/home': (context) => HomeScreen(),
          '/favorites': (context) => FavoritesScreen(),
          '/settings': (context) => SettingsScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/detail') {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => DetailScreen(item: args['item']),
            );
          }
          return null;
        },
      ),
    );
  }
}
