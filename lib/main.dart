import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getxproject/View/DummyScreen1.dart';
import 'package:getxproject/View/DummyScreen2.dart';
import 'package:getxproject/View/HomeScreen.dart';

import 'Controllerclass/Controllerclass.dart';
import 'View/MainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: Storebinding(),
      home: HomePage(),
      getPages: [
        GetPage(
            name: '/Mainscreen',
            page: ()=> Mainscreen()),

        GetPage(
            name: '/Dummy1',
            page: ()=> DummyPage()),

        GetPage(
            name: '/Dummy2',
            page: ()=> DummyPageSecond())
      ],
    );
  }


}


