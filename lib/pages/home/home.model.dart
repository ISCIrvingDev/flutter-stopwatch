class HomeModel {
  final int seconds, minutes, hours;
  final String digitSeconds, digitMinutes, digitHours;
  final List<String> laps;

  HomeModel({
    required this.seconds,
    required this.minutes,
    required this.hours,
    required this.digitSeconds,
    required this.digitMinutes,
    required this.digitHours,
    required this.laps,
  });
}
