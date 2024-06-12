import 'package:hive_flutter/hive_flutter.dart';
import 'package:tracker/screens/data/habit.dart';

class DataService {
  final String numCutie = "habitsBox";

   Future<Box<Habits>> get _box async => await Hive.openBox<Habits>(numCutie);

  Future<void> addHabit(Habits item) async {
    var box = await _box;
    await box.add(item);
  }

  Future<List<Habits>> getAllHabits() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteHabit(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }

}
