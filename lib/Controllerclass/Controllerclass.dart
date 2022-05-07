import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxproject/Api.dart';
import 'package:getxproject/Model/ParsingModelk.dart';
import 'package:http/http.dart' as http;


class StoreController extends GetxController{


  var getitemlist = ResponseModel().obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchdata();
  }


  void fetchdata()async{

    final dataitem = await Remoteclass.getdatafromapi();
    //productlist.value = dataitem;
    getitemlist.value = dataitem;

    print(getitemlist.value);

  }


  void changeScreen (String name){
    Get.toNamed(name);
  }

}


class Storebinding implements Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => StoreController());
  }

}



