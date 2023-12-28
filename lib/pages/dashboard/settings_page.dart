import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void _setDeviceToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('deviceToken', "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Settings'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  _setDeviceToken();
                  Navigator.pushNamed(context, '/scanPage');
                },
              ),
            ),
          ],
        ),
      body: const Text("Test"),
    );
  }
}