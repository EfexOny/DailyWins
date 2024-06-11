// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actionType.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class actionTypeAdapter extends TypeAdapter<actionType> {
  @override
  final int typeId = 3;

  @override
  actionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return actionType.times;
      case 1:
        return actionType.minutes;
      default:
        return actionType.times;
    }
  }

  @override
  void write(BinaryWriter writer, actionType obj) {
    switch (obj) {
      case actionType.times:
        writer.writeByte(0);
        break;
      case actionType.minutes:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is actionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
