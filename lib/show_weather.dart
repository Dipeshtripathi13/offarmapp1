import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:offarmapp/weathermoder/weather.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);


  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
late Weather? _weather; //later added ?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder (
            builder: (context, AsyncSnapshot? snapshot) {
          

              
              if (snapshot != null) {
                _weather = snapshot.data;
                if (_weather == null) {
                  //previous return const Text('error in loading weather') this dont work
                  return const CircularProgressIndicator(); //this work why? I don't know
                } else {
                  return  weatherBox(_weather!); //later added !
                }
              } else {
                return const CircularProgressIndicator();
              }
            },
          future: getCurrentWeather(),
        ),
      )
    );
  }
}

Widget weatherBox(Weather _weather) {
  
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Container(
          margin: const EdgeInsets.all(10.0),
          child: 
          Text("${_weather.temp}°C",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
          )
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          child: Text(_weather.description)
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          child: Text("Feels:${_weather.feelsLike}°C")
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          child: Text("H:${_weather.high}°C L:${_weather.low}°C")
        ),
    ]
  
  );  
}

Future getCurrentWeather() async {
 Weather? weather;
  String city = "pokhara";
  String apiKey = "14640aa78a72e95e7138470dd8dc01ed";
  var url = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    weather = Weather.fromJson(jsonDecode(response.body));
  }

  return weather;
}