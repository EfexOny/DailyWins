// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freqType.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class freqTypeAdapter extends TypeAdapter<freqType> {
  @override
  final int typeId = 2;

  @override
  freqType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return freqType.daily;
      case 1:
        return freqType.weekly;
      default:
        return freqType.daily;
    }
  }

  @override
  void write(BinaryWriter writer, freqType obj) {
    switch (obj) {
      case freqType.daily:
        writer.writeByte(0);
        break;
      case freqType.weekly:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is freqTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
