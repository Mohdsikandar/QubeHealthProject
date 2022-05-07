import 'dart:convert';

import 'package:getxproject/Model/ParsingModelk.dart';
import 'package:http/http.dart' as http;


class Remoteclass{


  static Future<ResponseModel> getdatafromapi() async {


    Map map = {
      "user_id":"3206161992",
      "feeling_date":"15-04-2022"
    };

    String body = json.encode(map);

    var url = new Uri.https("www.qubehealth.com", "/qube_services/api/testservice/getListOfUserFeeling");
    final http.Response response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "X-Api-Key": "f6d646a6c2f2df883ea0cccaa4097358ede98284",
        },
        body:body
    );

    print(response);

    if (response.statusCode == 200) {

      return ResponseModel.fromJson(json.decode(response.body));

    } else {
      throw Exception('Failed to load themes');
    }
  }


}