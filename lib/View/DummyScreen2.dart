import 'package:flutter/material.dart';

class DummyPageSecond extends StatefulWidget {
  const DummyPageSecond({Key? key}) : super(key: key);

  @override
  State<DummyPageSecond> createState() => _DummyPageSecondState();
}

class _DummyPageSecondState extends State<DummyPageSecond> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Dummy Screen 2"),
            backgroundColor: Colors.orangeAccent,
          ),
          body: Center(child: Text("Dummy Page 2")),
        ),
      ),
    );
  }
}
