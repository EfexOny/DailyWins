
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)

class User{
  @HiveField(0,defaultValue: "")
  String name;

  User({required this.name});
}