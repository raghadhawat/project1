import 'package:hive/hive.dart';

part 'add_order_model.g.dart';

@HiveType(typeId: 0)
class AddOrderModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String tName;
  @HiveField(2)
  String quantity;
  @HiveField(3)
  final String image;
  AddOrderModel({
    required this.name,
    required this.tName,
    required this.quantity,
    required this.image,
  });
}
