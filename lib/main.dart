import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(title: 'StopWatch'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // * Bussiness logic
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = '00', digitMinutes = '00', digitHours = '00';
  Timer? timer;
  bool started = false;
  List<String> laps = [];

  void stop() {
    timer!.cancel();

    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();

    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = '00';
      digitMinutes = '00';
      digitHours = '00';

      started = false;
    });
  }

  void addLaps() {
    String lap = '$digitHours:$digitMinutes:$digitSeconds';

    setState(() {
      laps.add(lap);
    });
  }

  void start() {
    started = true;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }

      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;

        digitSeconds = seconds >= 10 ? '$seconds' : '0$seconds';
        digitMinutes = minutes >= 10 ? '$minutes' : '0$minutes';
        digitHours = hours >= 10 ? '$hours' : '0$hours';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1c2757),
      appBar: AppBar(
        backgroundColor: const Color(0XFF1c2757),
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '00:00:00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 82,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0XFF323F68),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Start',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(width: 8),
                  IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Icon(Icons.flag),
                  ),
                  SizedBox(width: 8),

                  Expanded(
                    child: RawMaterialButton(
                      fillColor: Colors.blue,
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
