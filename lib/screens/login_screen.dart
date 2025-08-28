import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/local_storage.dart';
import '../services/notification_service.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  String? _error;

  void _login() {
    setState(() {
      _error = null;
    });
    final email = _emailCtrl.text.trim();
    final pass = _passwordCtrl.text.trim();
    final user = LocalStorage.getUser(email);
    if (user == null) {
      setState(() {
        _error = 'Email belum terdaftar';
      });
      return;
    }
    if (user['password'] != pass) {
      setState(() {
        _error = 'Password salah';
      });
      return;
    }
    Provider.of<AppState>(context, listen: false).login(email);
    Navigator.pushReplacementNamed(context, '/home');
// optional: show a test notification after login
    NotificationService().showTestNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailCtrl,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordCtrl,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 12),
            if (_error != null)
              Text(_error!, style: TextStyle(color: Colors.red)),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: Text('Belum punya akun? Daftar'))
          ],
        ),
      ),
    );
  }
}
