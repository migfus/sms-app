import 'package:flutter/material.dart';

import '../../components/app_bar_search_component.dart';

class SentMessagePage extends StatefulWidget {
  const SentMessagePage({super.key});

  @override
  State<SentMessagePage> createState() => _SentMessagePageState();
}

class _SentMessagePageState extends State<SentMessagePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSearchComponent(title: 'Sent SMS',),
      body: Text("Test"),
    );
  }
}