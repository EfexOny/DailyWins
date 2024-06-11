
import 'package:hive_flutter/hive_flutter.dart';
part 'freqType.g.dart';

@HiveType(typeId: 2)
enum freqType { 
  @HiveField(0)
    daily, 
  @HiveField(1)
    weekly
}

