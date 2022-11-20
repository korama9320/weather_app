import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weather = WeatherModel();
  void getLocationData() async {
    var data = await weather.getWeatherData();
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  locationWeather: data,
                )));
  }

//https://api.openweathermap.org/data/2.5/weather?q={city}&appid=21ce8cad5daf9c4330138fa80bb819e8&units=metric
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();

    return const Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.blue,
        size: 100,
      )),
    );
  }
}
