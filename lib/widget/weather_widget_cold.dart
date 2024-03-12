import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:weather/Model/model.dart';
import 'package:weather/constant.dart';

Weatherdata? weatherdata;
var x = 273.15;
DateTime now = DateTime.now();

class weather_widget_cold extends StatelessWidget {
  final weatherdata2;
  final isswitched2;
  weather_widget_cold({Key? key, this.weatherdata2, this.isswitched2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          weatherdata2!.name,
          style: isswitched2 ? blacktheme : lighttheme,
        ),
        Text(
          now.day.toString() +
              ' - ' +
              now.month.toString() +
              ' - ' +
              now.year.toString(),
          style: isswitched2 ? blacktheme : lighttheme,
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 330,
            width: 330,
            child: Column(
              children: [
                Lottie.asset(
                  'assets/cloud.json',
                  width: 220,
                  height: 220,
                  fit: BoxFit.fill,
                ),
                Text(
                  (weatherdata2!.main.temp - x).toInt().toString() + '°C',
                  style: isswitched2 ? blacktheme : lighttheme,
                ),
                Text(
                  'Cold',
                  style: isswitched2 ? blacktheme : lighttheme,
                ),
              ],
            )),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 110,
              width: 110,
              child: Column(
                children: [
                  ImageIcon(
                    AssetImage("assets/temp.png"),
                    color: Color(0xff88adf1),
                    size: 50,
                  ),
                  Text(
                    (weatherdata2!.main.feelsLike - x).toInt().toString() +
                        '°C',
                    style: isswitched2 ? blacktheme : lighttheme,
                  ),
                  Text(
                    'feel like',
                    style: isswitched2 ? blacktheme : lighttheme,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 110,
              width: 110,
              child: Column(
                children: [
                  ImageIcon(
                    AssetImage("assets/h.png"),
                    color: Color(0xff88adf1),
                    size: 40,
                  ),
                  Text(
                    (weatherdata2!.main.humidity).toString() + '%',
                    style: isswitched2 ? blacktheme : lighttheme,
                  ),
                  Text(
                    'humidity',
                    style: isswitched2 ? blacktheme : lighttheme,
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
