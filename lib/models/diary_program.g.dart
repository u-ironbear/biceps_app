// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_program.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiaryProgramAdapter extends TypeAdapter<DiaryProgram> {
  @override
  final int typeId = 0;

  @override
  DiaryProgram read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiaryProgram(
      startDate: fields[0] as DateTime,
      duration: fields[1] as int,
      split: fields[2] as int,
      trainingDates: (fields[3] as List)?.cast<DateTime>(),
      trainingDays: (fields[4] as List)?.cast<TrainingDay>(),
    );
  }

  @override
  void write(BinaryWriter writer, DiaryProgram obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.startDate)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.split)
      ..writeByte(3)
      ..write(obj.trainingDates)
      ..writeByte(4)
      ..write(obj.trainingDays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiaryProgramAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
