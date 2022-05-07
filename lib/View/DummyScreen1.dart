import 'package:flutter/material.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Dummy Screen 1"),
            backgroundColor: Colors.orangeAccent,
          ),
          body: Center(child: Text("Dummy Page 1")),
        ),
      ),
    );
  }
}
