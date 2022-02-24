import 'package:flutter/material.dart';
import 'package:flutter_personal_expenses_tracker/layout/app_layout.dart';

class PiechartPage extends StatefulWidget {
  const PiechartPage({Key? key}) : super(key: key);

  @override
  State<PiechartPage> createState() => _PiechartPageState();
}

class _PiechartPageState extends State<PiechartPage> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: AppLayout(
                content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("In Progress"),
        )
      ],
    ))));
  }
}
