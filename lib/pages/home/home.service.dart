/*
  * Este archivo se deja como muestra pa ver como se veian los metodos con el "setState"
*/

// import 'dart:async';

// * Business logic
class HomeService {
  // int seconds = 0, minutes = 0, hours = 0;
  // String digitSeconds = '00', digitMinutes = '00', digitHours = '00';
  // Timer? timer;
  // bool started = false;
  // List<String> laps = [];

  // void stop() {
  //   timer!.cancel();

  //   setState(() {
  //     started = false;
  //   });
  // }

  // void reset() {
  //   timer!.cancel();

  //   setState(() {
  //     seconds = 0;
  //     minutes = 0;
  //     hours = 0;

  //     digitSeconds = '00';
  //     digitMinutes = '00';
  //     digitHours = '00';

  //     started = false;
  //   });
  // }

  // void addLaps() {
  //   String lap = '$digitHours:$digitMinutes:$digitSeconds';

  //   setState(() {
  //     laps.add(lap);
  //   });
  // }

  // void start() {
  //   started = true;

  //   timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     int localSeconds = seconds + 1;
  //     int localMinutes = minutes;
  //     int localHours = hours;

  //     if (localSeconds > 59) {
  //       if (localMinutes > 59) {
  //         localHours++;
  //         localMinutes = 0;
  //       } else {
  //         localMinutes++;
  //         localSeconds = 0;
  //       }
  //     }

  //     setState(() {
  //       seconds = localSeconds;
  //       minutes = localMinutes;
  //       hours = localHours;

  //       digitSeconds = seconds >= 10 ? '$seconds' : '0$seconds';
  //       digitMinutes = minutes >= 10 ? '$minutes' : '0$minutes';
  //       digitHours = hours >= 10 ? '$hours' : '0$hours';
  //     });
  //   });
  // }
}
