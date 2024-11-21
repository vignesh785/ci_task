import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double price;

  @HiveField(3)
  String description;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.description,
  });
}
