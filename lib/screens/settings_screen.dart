import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                subtitle: Text('Enable test notifications')),
            ElevatedButton(
                onPressed: () => NotificationService().showTestNotification(),
                child: Text('Send Test Notification')),
            SizedBox(height: 16),
            ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                subtitle: Text('Capstone minimal app'))
          ],
        ),
      ),
    );
  }
}
