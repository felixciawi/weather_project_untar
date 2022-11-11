import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_project/weather.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({required this.weatherService});

  final WeatherService weatherService;

  @override
  State<WeatherPage> createState() => _WeatherPageeState();
}

class _WeatherPageeState extends State<WeatherPage> {
  late String temperature = "";
  late String weatherIcon = "";
  late String cityName = "";
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() async {
    WeatherService data = await widget.weatherService.getWeatherData();
    setState(() {
      temperature = data.temperature;
      weatherIcon = data.weatherIcon;
      cityName = data.cityName;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/1779/1779940.png'),
                width: 130,
                height: 130,
              ),
              Text(!isLoading ? cityName : "loading... ",
                  style: GoogleFonts.kolkerBrush(fontSize: 65)),
              Text(!isLoading ? '$temperature Celcius' : "loading... ",
                  style: TextStyle(fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }
}
