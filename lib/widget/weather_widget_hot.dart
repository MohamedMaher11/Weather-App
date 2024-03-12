import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/constant.dart';

import 'package:weather/Model/model.dart';

Weatherdata? weatherdata;
var x = 273.15;
DateTime now = DateTime.now();

class weatherwidget extends StatelessWidget {
  final weatherdata1;
  final isswitched;
  weatherwidget({Key? key, this.weatherdata1, this.isswitched})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          weatherdata1.name,
          style: isswitched ? blacktheme : lighttheme,
        ),
        Text(
          now.day.toString() +
              ' - ' +
              now.month.toString() +
              ' - ' +
              now.year.toString(),
          style: isswitched ? blacktheme : lighttheme,
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
                  'assets/welcome.json',
                  width: 180,
                  height: 180,
                  fit: BoxFit.fill,
                ),
                Text(
                  (weatherdata1!.main.temp - x).toInt().toString() + '°C',
                  style: isswitched ? blacktheme : lighttheme,
                ),
                Text(
                  'Sunny',
                  style: isswitched ? blacktheme : lighttheme,
                ),
              ],
            )),
        SizedBox(
          height: 20,
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
                    (weatherdata1!.main.feelsLike - x).toInt().toString() +
                        '°C',
                    style: isswitched ? blacktheme : lighttheme,
                  ),
                  Text(
                    'feel like',
                    style: isswitched ? blacktheme : lighttheme,
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
                    (weatherdata1!.main.humidity).toString() + '%',
                    style: isswitched ? blacktheme : lighttheme,
                  ),
                  Text(
                    'humidity',
                    style: isswitched ? blacktheme : lighttheme,
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
