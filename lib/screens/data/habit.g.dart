// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitsAdapter extends TypeAdapter<Habits> {
  @override
  final int typeId = 4;

  @override
  Habits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Habits(
      days: (fields[2] as List).cast<int>(),
      type: fields[0] as String,
      actiontype: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Habits obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.actiontype)
      ..writeByte(2)
      ..write(obj.days);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
