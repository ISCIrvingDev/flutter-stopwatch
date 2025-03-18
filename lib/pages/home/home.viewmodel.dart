import 'dart:async';
import 'package:flutter/material.dart';

import 'home.model.dart';

class HomeViewModel extends ChangeNotifier {
  HomeModel _homeModel = HomeModel(
    seconds: 0,
    minutes: 0,
    hours: 0,
    digitSeconds: '00',
    digitMinutes: '00',
    digitHours: '00',
    laps: [],
  );

  HomeModel get homeModel => _homeModel;

  Timer? timer;
  bool started = false;

  void setHomeModel(HomeModel newVal) {
    _homeModel = newVal;

    notifyListeners();
  }

  void stop() {
    timer!.cancel();

    // * Old version - setState version
    /*
    setState(() {
      started = false;
    });
    */

    // * New Version - MVVM version
    // Se manda a llamar esta funcion en lugar del "setState" para notificar a la vista que ha habido cambios que requieren renderizar de nuevo la vista
    started = false;

    notifyListeners();
  }

  void reset() {
    timer!.cancel();

    // * Old version - setState version
    /*
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = '00';
      digitMinutes = '00';
      digitHours = '00';

      started = false;
    });
    */

    // * New Version - MVVM version
    // Se manda a llamar esta funcion en lugar del "setState" para notificar a la vista que ha habido cambios que requieren renderizar de nuevo la vista
    var originalLaps = _homeModel.laps;

    _homeModel = HomeModel(
      seconds: 0,
      minutes: 0,
      hours: 0,
      digitSeconds: '00',
      digitMinutes: '00',
      digitHours: '00',
      laps: originalLaps,
    );

    started = false;

    notifyListeners();
  }

  void addLaps() {
    String lap =
        '${_homeModel.digitHours}:${_homeModel.digitMinutes}:${_homeModel.digitSeconds}';

    // * Old version - setState version
    /*
    setState(() {
      laps.add(lap);
    });
    */

    // * New Version - MVVM version
    // Se manda a llamar esta funcion en lugar del "setState" para notificar a la vista que ha habido cambios que requieren renderizar de nuevo la vista
    // _homeModel = HomeModel(
    //   seconds: _homeModel.seconds,
    //   minutes: _homeModel.minutes,
    //   hours: _homeModel.hours,
    //   digitSeconds: _homeModel.digitSeconds,
    //   digitMinutes: _homeModel.digitMinutes,
    //   digitHours: _homeModel.digitHours,
    //   laps: _homeModel.laps.add(),
    // );
    _homeModel.laps.add(lap);

    notifyListeners();
  }

  void start() {
    started = true;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = _homeModel.seconds + 1;
      int localMinutes = _homeModel.minutes;
      int localHours = _homeModel.hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }

      // * Old version - setState version
      /*
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;

        digitSeconds = seconds >= 10 ? '$seconds' : '0$seconds';
        digitMinutes = minutes >= 10 ? '$minutes' : '0$minutes';
        digitHours = hours >= 10 ? '$hours' : '0$hours';
      });
      */

      // * New Version - MVVM version
      // Se manda a llamar esta funcion en lugar del "setState" para notificar a la vista que ha habido cambios que requieren renderizar de nuevo la vista
      var originalLaps = _homeModel.laps;

      _homeModel = HomeModel(
        seconds: localSeconds,
        minutes: localMinutes,
        hours: localHours,
        digitSeconds: localSeconds >= 10 ? '$localSeconds' : '0$localSeconds',
        digitMinutes: localMinutes >= 10 ? '$localMinutes' : '0$localMinutes',
        digitHours: localHours >= 10 ? '$localHours' : '0$localHours',
        laps: originalLaps,
      );

      notifyListeners();
    });
  }
}
