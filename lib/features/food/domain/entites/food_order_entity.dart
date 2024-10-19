import 'package:equatable/equatable.dart';

class FoodOrderEntity extends Equatable {
  final int id;
  final int number;

  const FoodOrderEntity({required this.id, required this.number});

  FoodOrderEntity copyWith({int? id, int? number}) {
    return FoodOrderEntity(id: id ?? this.id, number: number ?? this.number);
  }

  @override
  List<Object?> get props => [id, number];

  @override
  String toString() {
    return 'FoodOrderEntity{id=$id, number=$number}';
  }
}
