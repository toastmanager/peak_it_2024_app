import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:peak_it_2024_app/features/food/data/repositories/food_repository_impl.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_category_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/repositories/food_repository.dart';
import 'package:peak_it_2024_app/features/food/domain/usecases/get_categories.dart';
import 'package:peak_it_2024_app/features/food/domain/usecases/order_food.dart';
import 'package:peak_it_2024_app/injection.dart';

part 'food_event.dart';
part 'food_state.dart';

@Injectable(order: 99999)
class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final GetCategories getCategories = GetCategories(repository: FoodRepositoryImpl());
  // final OrderFood orderFood = OrderFood(repository: FoodRepositoryImpl());
  // final Logger logger = Logger();

  FoodBloc(
      // {required this.getCategories,
      // required this.orderFood,
      // required this.logger}
      )
      : super(FoodInitial()) {
    on<FoodGetCategories>(_onGetCategories);
  }

  List<FoodCategoryEntity> categories = [];

  Future<void> _onGetCategories(
      FoodGetCategories event, Emitter<FoodState> emit) async {
    emit(FoodLoading());
    try {
      final categoriesList = await getCategories.execute();
      categories = categoriesList;
      emit(FoodLoaded(categories: categoriesList));
    } catch (e) {
      emit(FoodFailed(message: e.toString()));
      // logger.e(e);
      rethrow;
    }
  }
}
