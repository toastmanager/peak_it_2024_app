import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final int price;
  final int weight;
  final int sharpness;
  final int number;

  const FoodEntity(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.weight,
      required this.sharpness,
      this.number = 0});

  @override
  List<Object?> get props =>
      [id, imageUrl, name, price, weight, sharpness, number];

  FoodEntity copyWith(
      {int? id,
      String? imageUrl,
      String? name,
      int? price,
      int? weight,
      int? sharpness,
      int? number}) {
    return FoodEntity(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        name: name ?? this.name,
        price: price ?? this.price,
        weight: weight ?? this.weight,
        sharpness: sharpness ?? this.sharpness,
        number: number ?? this.number);
  }

  @override
  String toString() {
    return 'FoodEntity{id=$id, imageUrl=$imageUrl, name=$name, price=$price, weight=$weight, sharpness=$sharpness, number=$number}';
  }
}
