import 'package:flutter/material.dart';
import '../services/local_storage.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  String? _error;

  void _register() async {
    setState(() {
      _error = null;
    });
    if (!_formKey.currentState!.validate()) return;
    final email = _emailCtrl.text.trim();
    final existing = LocalStorage.getUser(email);
    if (existing != null) {
      setState(() {
        _error = 'Email sudah terdaftar';
      });
      return;
    }
    await LocalStorage.saveUser(
        email, _usernameCtrl.text.trim(), _passwordCtrl.text.trim());
// After registration, navigate to login
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameCtrl,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Masukkan username' : null,
              ),
              TextFormField(
                controller: _emailCtrl,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (v) =>
                    v == null || !v.contains('@') ? 'Email tidak valid' : null,
              ),
              TextFormField(
                controller: _passwordCtrl,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (v) => v == null || v.length < 6
                    ? 'Password minimal 6 karakter'
                    : null,
              ),
              SizedBox(height: 12),
              if (_error != null)
                Text(_error!, style: TextStyle(color: Colors.red)),
              ElevatedButton(onPressed: _register, child: Text('Daftar')),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Sudah punya akun? Login'))
            ],
          ),
        ),
      ),
    );
  }
}
