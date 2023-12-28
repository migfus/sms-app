import 'package:flutter/material.dart';
import 'package:sms_app/components/app_bar_search_component.dart';

class PendingMessagePage extends StatefulWidget {
  const PendingMessagePage({super.key});

  @override
  State<PendingMessagePage> createState() => PendingMessagePageState();
}

class PendingMessagePageState extends State<PendingMessagePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSearchComponent(title: 'Pending SMS',),
      body: Text("Test"),
    );
  }

}
