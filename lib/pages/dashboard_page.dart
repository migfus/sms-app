import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_app/pages/dashboard/pending_message_page.dart';
import 'package:sms_app/pages/dashboard/sent_message_page.dart';
import 'package:sms_app/pages/dashboard/settings_page.dart';
import 'package:sms_app/pages/scan_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String deviceToken = '';
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    PendingMessagePage(),
    SentMessagePage(),  
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState(); // Always call super.initState() first

    _getDeviceToken();
  }

  void _getDeviceToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => deviceToken = prefs.getString('deviceToken') ?? "");
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.teal,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.library_add),
              label: 'Pending',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Sent',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      routes: {
        '/scanPage': (context) => const ScanPage(),
      }
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Placeholder(
  //     child: Center(
  //       child: Column(
  //         children: [
  //           Text("Device Token ID $deviceToken"),
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               minimumSize: const Size.fromHeight(50),
  //             ),
  //             onPressed: () async {
  //               Navigator.pushNamed(context, '/scanPage');
              
  //               final prefs = await SharedPreferences.getInstance();
  //               prefs.setString('deviceToken', "");
  //             },
  //             child: const Text("DISCONNECT")
  //           ),
  //         ],
  //       ),
  //     )
  //   );
  // }

}