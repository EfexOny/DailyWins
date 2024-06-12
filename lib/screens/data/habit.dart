import 'package:hive/hive.dart';
import 'package:tracker/screens/data/actionType.dart';
import 'package:tracker/screens/data/freqType.dart';

part 'habit.g.dart';

@HiveType(typeId: 4)
class Habits {
  @HiveField(0)
  String type;

  @HiveField(1)
  String actiontype;

  @HiveField(2)
  List<int> days;

  Habits({required this.days, required this.type, required this.actiontype});
}
