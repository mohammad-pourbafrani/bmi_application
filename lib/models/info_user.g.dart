// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfoUserAdapter extends TypeAdapter<InfoUser> {
  @override
  final int typeId = 0;

  @override
  InfoUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InfoUser(
      name: fields[0] as String,
      age: fields[2] as int,
      gender: fields[1] as String,
      height: fields[3] as int,
      weight: fields[4] as int,
      bmi: fields[5] as double,
      date: fields[6] as DateTime,
      status: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, InfoUser obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.bmi)
      ..writeByte(6)
      ..write(obj.date)
      ..writeByte(7)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
