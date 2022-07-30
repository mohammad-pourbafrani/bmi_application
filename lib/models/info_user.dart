import 'package:hive/hive.dart';

part 'info_user.g.dart';

@HiveType(typeId: 0)
class InfoUser {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String gender;

  @HiveField(2)
  final int age;

  @HiveField(3)
  final int height;

  @HiveField(4)
  final int weight;

  @HiveField(5)
  final double bmi;

  @HiveField(6)
  final DateTime date;

  @HiveField(7)
  final String status;

  InfoUser(
      {required this.name,
      required this.age,
      required this.gender,
      required this.height,
      required this.weight,
      required this.bmi,
      required this.date,
      required this.status});
}
