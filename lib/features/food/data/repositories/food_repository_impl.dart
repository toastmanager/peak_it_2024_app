import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_category_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_order_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/repositories/food_repository.dart';

@Singleton(as: FoodRepository)
class FoodRepositoryImpl implements FoodRepository {
  FoodRepositoryImpl();

  @override
  Future<List<FoodCategoryEntity>> getCategories() async {
    // TODO: implement getCategories
    return _mockCategories();
  }

  @override
  Future<bool> orderFood(List<FoodOrderEntity> food) {
    // TODO: implement orderFood
    throw UnimplementedError();
  }

  FoodEntity _gunbao(int id) {
    return FoodEntity(
        id: id,
        imageUrl: 'assets/images/gunbao.png',
        name: 'Гунбао на сковородке',
        price: 479,
        weight: 350,
        sharpness: 2);
  }

  FoodEntity _pekinChicken(int id) {
    return FoodEntity(
        id: id,
        imageUrl: 'assets/images/chicken.png',
        name: 'Утка по пекински',
        price: 589,
        weight: 430,
        sharpness: 3);
  }

  FoodEntity _chauMein(int id) {
    return FoodEntity(
        id: id,
        imageUrl:
            'assets/images/chaumein.png',
        name: 'Чау-мейн',
        price: 349,
        weight: 410,
        sharpness: 0);
  }

  FoodEntity _yakisoba(int id) {
    return FoodEntity(
        id: id,
        imageUrl: 'assets/images/yakisoba.png',
        name: 'Якисоба',
        price: 419,
        weight: 350,
        sharpness: 1);
  }

  FoodEntity _maPoTofu(int id) {
    return FoodEntity(
        id: id,
        imageUrl: 'assets/images/mapotofu.png',
        name: 'Ма По Тофу',
        price: 219,
        weight: 180,
        sharpness: 0);
  }

  List<FoodCategoryEntity> _mockCategories() {
    return [
      FoodCategoryEntity(id: 1, imageUrl: '', name: "Популярное", food: [
        _gunbao(0),
        _pekinChicken(1),
        _chauMein(2),
        _yakisoba(3),
        _maPoTofu(4)
      ]),
      FoodCategoryEntity(id: 2, imageUrl: 'assets/images/drinks.png', name: "Напитки", food: [
        _pekinChicken(5),
        _yakisoba(6),
        _gunbao(7),
        _chauMein(8),
        _maPoTofu(9)
      ]),
      FoodCategoryEntity(id: 3, imageUrl: '', name: "Острое", food: [
        _chauMein(13),
        _gunbao(12),
        _yakisoba(11),
        _pekinChicken(10),
        _maPoTofu(14)
      ]),
      FoodCategoryEntity(id: 4, imageUrl: 'assets/images/tea.png', name: "Чай", food: [
        _pekinChicken(15),
        _yakisoba(16),
        _gunbao(17),
        _chauMein(18),
        _maPoTofu(19)
      ]),
    ];
  }
}
