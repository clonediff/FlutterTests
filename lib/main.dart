import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.red.shade400,
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: Colors.red.shade500,
            centerTitle: true,
          ),
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text('Weather Forecast')),
          body: Center(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: const [
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(fontSize: 15),
                      icon: Icon(Icons.search),
                      border: InputBorder.none),
                ),
                SizedBox(
                  height: 20,
                ),
                CityDetail(),
                SizedBox(
                  height: 30,
                ),
                TemperatureDetail(),
                SizedBox(
                  height: 40,
                ),
                ExtraWeatherDetail(),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    '7-DAY WEATHER FORECAST',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                BottomDetail(),
              ],
            ),
          ),
        ));
  }
}

class CityDetail extends StatelessWidget {
  const CityDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            'Murmansk Oblast, RU',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Friday, Mar 20, 2020',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class TemperatureDetail extends StatelessWidget {
  const TemperatureDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.wb_sunny, size: 80),
        Column(
          children: [
            Text(
              '14 °F',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              'Light Snow',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ExtraWeatherDetail extends StatelessWidget {
  const ExtraWeatherDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ExtraWeatherItem(icon: Icons.ac_unit, middle: '5', bottom: 'km/hr'),
          ExtraWeatherItem(icon: Icons.ac_unit, middle: '3', bottom: '%'),
          ExtraWeatherItem(icon: Icons.ac_unit, middle: '20', bottom: '%'),
        ],
      ),
    );
  }
}

class ExtraWeatherItem extends StatelessWidget {
  final IconData icon;
  final String middle;
  final String bottom;

  const ExtraWeatherItem({
    super.key,
    required this.icon,
    required this.middle,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        Text(
          middle,
          style: const TextStyle(fontSize: 25),
        ),
        Text(
          bottom,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}

class BottomDetail extends StatelessWidget {
  const BottomDetail({super.key});

  @override
  Widget build(BuildContext context) {
    List<({String day, int temperature, IconData weatherIcon})> forecast = [
      (day: 'Friday', temperature: 6, weatherIcon: Icons.wb_sunny),
      (day: 'Saturday', temperature: 5, weatherIcon: Icons.wb_sunny),
      (day: 'Sunday', temperature: 22, weatherIcon: Icons.wb_sunny),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: forecast.length,
          itemBuilder: (context, index) => Card(
            color: Colors.red.shade200,
            shape: const RoundedRectangleBorder(),
            child: Container(
              width: 150,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    forecast[index].day,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${forecast[index].temperature} °F',
                        style: const TextStyle(fontSize: 30),
                      ),
                      Icon(
                        forecast[index].weatherIcon,
                        size: 40,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DefaultAppBar extends AppBar {
  DefaultAppBar({super.key, required Widget title})
      : super(
          title: title,
          backgroundColor: Colors.blue,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        );
}
