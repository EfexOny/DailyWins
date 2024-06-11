  import 'package:hive_flutter/hive_flutter.dart';
part 'actionType.g.dart';

@HiveType(typeId: 3)  
enum actionType {
  @HiveField(0)
  times,
  @HiveField(1)
  minutes
}

