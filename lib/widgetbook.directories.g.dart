// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:peak_it_2024_app/features/food/presentation/widgets/category_card.dart'
    as _i2;
import 'package:peak_it_2024_app/features/food/presentation/widgets/food_card.dart'
    as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'features',
    children: [
      _i1.WidgetbookFolder(
        name: 'food',
        children: [
          _i1.WidgetbookFolder(
            name: 'presentation',
            children: [
              _i1.WidgetbookFolder(
                name: 'widgets',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'CategoryCard',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Long without image',
                        builder: _i2.longCategoryWithoutImage,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Short without image',
                        builder: _i2.shortCategoryWithoutImage,
                      ),
                    ],
                  ),
                  _i1.WidgetbookComponent(
                    name: 'FoodCard',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Light Hot',
                        builder: _i3.lightHotFoodCard,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Middle Hot',
                        builder: _i3.middleHotFoodCard,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Very Hot',
                        builder: _i3.veryHotFoodCard,
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      )
    ],
  )
];
