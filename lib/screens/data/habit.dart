import 'package:hive/hive.dart';

part 'habit.g.dart'; // This will be generated

@HiveType(typeId: 0)
class Habit {
  @HiveField(0)
  String name;

  @HiveField(1)
  int amount;

  @HiveField(2)
  String frequency;

  @HiveField(3)
  String type;

  @HiveField(4)
  String status;

  Habit({required this.name, required this.amount, required this.frequency, required this.type, required this.status});
}