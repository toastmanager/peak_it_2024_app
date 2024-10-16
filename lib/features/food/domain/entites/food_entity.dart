import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final int id;
  final String name;
  final int price;
  final int weight;
  final int sharpness;
  final int number;

  const FoodEntity(
      {required this.id,
      required this.name,
      required this.price,
      required this.weight,
      required this.sharpness,
      required this.number});

  @override
  List<Object?> get props => [id, name, price, weight, sharpness, number];

  FoodEntity copyWith(
      {int? id,
      String? name,
      int? price,
      int? weight,
      int? sharpness,
      int? number}) {
    return FoodEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        weight: weight ?? this.weight,
        sharpness: sharpness ?? this.sharpness,
        number: number ?? this.number);
  }

  @override
  String toString() {
    return 'FoodEntity{id=$id, name=$name, price=$price, weight=$weight, sharpness=$sharpness, number=$number}';
  }
}
