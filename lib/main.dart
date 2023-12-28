import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_app/pages/dashboard_page.dart';

import 'package:sms_app/pages/intro_page.dart';
import 'package:sms_app/pages/scan_page.dart';
import 'package:sms_app/stores/intro_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final String deviceToken = prefs.getString('deviceToken') ?? "";

  runApp(
    ChangeNotifierProvider(
      create: (context) => IntroStore(), 
      child: MyApp(deviceToken: deviceToken)
    )
  );
}

class MyApp extends StatelessWidget {
  final String deviceToken;

  const MyApp({super.key, required this.deviceToken});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      // home: deviceToken == "" ? const IntroPage() : const DashboardPage(),
      home: const IntroPage(),
      routes: {
        '/scanPage': (context) => const ScanPage(),
        '/introPage': (context) => const IntroPage(),
        '/dashboardPage': (context) => const DashboardPage(),
      }
    );
  }
}