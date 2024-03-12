import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:weather/Model/model.dart';
import 'package:weather/constant.dart';

import 'package:weather/widget/weather_widget_cold.dart';
import 'package:weather/widget/weather_widget_hot.dart';

bool isswitched = false;

class myhomepage extends StatefulWidget {
  const myhomepage({Key? key}) : super(key: key);

  @override
  State<myhomepage> createState() => _myhomepageState();
}

class _myhomepageState extends State<myhomepage> {
  final citycontroller = TextEditingController(text: '');
  bool isloading = false;
  Weatherdata? weatherdata;
  DateTime now = DateTime.now();

  getdata() async {
    isloading = true;
    setState(() {});
    final response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/weather?q=${citycontroller.text}&appid=509dc5d730ff2dd6003b22f30ae93313');
    weatherdata = Weatherdata.fromJson(response.data);
    print(response.data);
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      citycontroller.text = "cairo";
      getdata();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(

        //appbar
        appBar: AppBar(
          backgroundColor: isswitched ? Color(0xff090a0a) : Color(0xffeaedf1),
          elevation: 0.0,
          title: Text(
            'Weather App',
            style: isswitched ? blacktheme : lighttheme,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    color: isswitched ? Colors.white : Colors.black,
                    onPressed: () {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                title: Text('Search By City Name'),
                                content: TextField(
                                  onChanged: (value) {},
                                  controller: citycontroller,
                                  decoration:
                                      InputDecoration(hintText: "City name : "),
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          getdata().then(
                                            Navigator.pop(
                                                context, citycontroller.text),
                                          );
                                        });
                                      },
                                      child: Text('Search'))
                                ],
                              );
                            });
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      size: 30,
                    )),
                Switch(
                    value: isswitched,
                    onChanged: (value) {
                      setState(() {
                        isswitched = value;
                      });
                    }),
              ],
            ),
          ],
        ),
        //end of appbar
        body:
            //Container of page
            Container(
          width: 500,
          height: MediaQuery.sizeOf(context).height,
          color: isswitched ? Color(0xff090a0a) : Color(0xffeaedf1),
          child: Column(
            children: [
              isloading //if is loading true
                  ? Center(
                      child: const CircularProgressIndicator(),
                    )
                  : weatherdata != null
                      ? Column(
                          children: [
                            weatherdata!.main.temp > 292
                                ? weatherwidget(
                                    weatherdata1: weatherdata,
                                    isswitched: isswitched)
                                : weather_widget_cold(
                                    weatherdata2: weatherdata,
                                    isswitched2: isswitched)
                          ],
                        )
                      : SizedBox(),
            ],
          ),
        ));
  }
}
