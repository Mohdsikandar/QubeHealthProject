import 'dart:convert';

import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

import '../Controllerclass/Controllerclass.dart';


class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {

  final storecontroller = Get.put(StoreController());

  String data = "";
  DateTime selectedDate = DateTime.now();

  getdate() {
    var dataw = "${selectedDate.toLocal()}".split(' ')[0];
    DateTime tempDate1 = DateTime.parse(dataw);
    data = DateFormat.yMMMd().add_jm().format(tempDate1);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storecontroller.fetchdata();
    getdate();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(child: Text("Your Feeling History",style: TextStyle(color: Colors.black,fontSize: 18),)),
          ),
          body: Obx(() =>
              storecontroller.getitemlist.value.data == null ? Center(
                child: CircularProgressIndicator(),
              ):SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10,top: 5),
                        child: Text("Your Feeling Last 30 Days",style: TextStyle(fontSize: 15),)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: Colors.grey,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Container(
                                    width: 40,
                                    margin: EdgeInsets.only(left: 5,right: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text("${storecontroller.getitemlist.value.data!.feelingPercentage!.happy}%",style: Theme.of(context).textTheme.titleMedium,)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(40)
                                            ),
                                            padding: EdgeInsets.all(5),
                                            child: Image.asset('assets/happy.png')
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text("${"Happy"}"),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: Colors.grey,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Container(
                                    width: 40,
                                    margin: EdgeInsets.only(left: 5,right: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text("${storecontroller.getitemlist.value.data!.feelingPercentage!.sad}%",style: Theme.of(context).textTheme.titleMedium,)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(40)
                                            ),
                                            padding: EdgeInsets.all(5),
                                            child: Image.asset('assets/sad.png')
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text("Sad"),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: Colors.grey,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Container(
                                    width: 40,
                                    margin: EdgeInsets.only(left: 5,right: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text("${storecontroller.getitemlist.value.data!.feelingPercentage!.energetic}%",style: Theme.of(context).textTheme.titleMedium,)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(40)
                                            ),
                                            padding: EdgeInsets.all(5),
                                            child: Image.asset('assets/energetic.png')
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text("Energetic"),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: Colors.grey,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Container(
                                    width: 40,
                                    margin: EdgeInsets.only(left: 5,right: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text("${storecontroller.getitemlist.value.data!.feelingPercentage!.calm}%",style: Theme.of(context).textTheme.titleMedium,)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(40)
                                            ),
                                            padding: EdgeInsets.all(5),
                                            child: Image.asset('assets/calm.png')
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text("Calm"),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: Colors.grey,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Container(
                                    width: 40,
                                    margin: EdgeInsets.only(left: 5,right: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text("${storecontroller.getitemlist.value.data!.feelingPercentage!.angry}%",style: Theme.of(context).textTheme.titleMedium,)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(40)
                                            ),
                                            padding: EdgeInsets.all(5),
                                            child: Image.asset('assets/angry.png')
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text("Angry"),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: Colors.grey,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Container(
                                    width: 40,
                                    margin: EdgeInsets.only(left: 5,right: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text("${storecontroller.getitemlist.value.data!.feelingPercentage!.bored}%",style: Theme.of(context).textTheme.titleMedium,)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(40)
                                            ),
                                            padding: EdgeInsets.all(5),
                                            child: Image.asset('assets/bored.png')
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text("Bored"),
                                )
                              ],
                            ),
                          ],
                        )
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.black26,
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.shade100,
                      ),
                      child: Text("${data}"),
                    ),
                    Container(
                      height: 100,
                      child: AnimatedHorizontalCalendar(
                          tableCalenderIcon: Icon(Icons.calendar_today, color: Colors.white,),
                          date: DateTime.now(),
                          textColor: Colors.black45,
                          backgroundColor: Colors.white,
                          tableCalenderThemeData:  ThemeData.light().copyWith(
                            primaryColor: Colors.green,
                            accentColor: Colors.red,
                            colorScheme: ColorScheme.light(primary: Colors.green),
                            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
                          ),
                          selectedColor: Colors.black54,
                          onDateSelected: (date){

                            DateTime tempDate1 = DateTime.parse(date);
                            String dattee = DateFormat.yMMMd().add_jm().format(tempDate1);

                            setState(() {
                              data = dattee;
                            });
                            print(date);
                          }
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.black26,
                    ),
                    Container(
                      height: 50,
                      child: ListView.builder(
                          itemCount: storecontroller.getitemlist.value.data!.feelingList!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(top: 10,left: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Text("12 PM - 1 PM"),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text("${storecontroller.getitemlist.value.data!.feelingList![index].feelingName}")
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.black26,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text("${storecontroller.getitemlist.value.data!.videoArr![0].title}",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: Text("${storecontroller.getitemlist.value.data!.videoArr![0].description}",textAlign: TextAlign.justify,),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: 'ml6cT4AZdqI', //Add videoID.
                          flags: YoutubePlayerFlags(
                            hideControls: false,
                            controlsVisibleAtStart: false,
                            autoPlay: false,
                            mute: false,
                            disableDragSeek: false,
                          ),
                        ),
                        showVideoProgressIndicator: false,
                        progressIndicatorColor: Colors.red,
                      ),
                    )
                  ],
                ),
              )
          )
        ),
      ),
    );
  }
}
