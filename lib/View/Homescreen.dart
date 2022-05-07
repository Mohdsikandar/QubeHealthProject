import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:getxproject/Controllerclass/Controllerclass.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final storecontroller = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home Screen"),
            backgroundColor: Colors.blue,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){

                  storecontroller.changeScreen('Mainscreen');
                },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Main Screen"),
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: (){
                     storecontroller.changeScreen('Dummy1');
                    },
                    child: Text("Dummy Screen1")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: (){
                      storecontroller.changeScreen('Dummy2');
                    },
                    child: Text("Dummy Screen2")),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
