// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddOrderModelAdapter extends TypeAdapter<AddOrderModel> {
  @override
  final int typeId = 0;

  @override
  AddOrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddOrderModel(
      name: fields[0] as String,
      tName: fields[1] as String,
      quantity: fields[2] as String,
      image: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddOrderModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.tName)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddOrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
