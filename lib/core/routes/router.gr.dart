// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:peak_it_2024_app/features/auth/presentation/pages/profile_page.dart'
    as _i4;
import 'package:peak_it_2024_app/features/food/presentation/pages/cart_page.dart'
    as _i1;
import 'package:peak_it_2024_app/features/food/presentation/pages/menu_page.dart'
    as _i3;
import 'package:peak_it_2024_app/main_wrapper.dart' as _i2;

/// generated route for
/// [_i1.CartPage]
class CartRoute extends _i5.PageRouteInfo<void> {
  const CartRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.CartPage();
    },
  );
}

/// generated route for
/// [_i2.MainWrapper]
class MainWrapper extends _i5.PageRouteInfo<void> {
  const MainWrapper({List<_i5.PageRouteInfo>? children})
      : super(
          MainWrapper.name,
          initialChildren: children,
        );

  static const String name = 'MainWrapper';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainWrapper();
    },
  );
}

/// generated route for
/// [_i3.MenuPage]
class MenuRoute extends _i5.PageRouteInfo<void> {
  const MenuRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.MenuPage();
    },
  );
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i5.PageRouteInfo<void> {
  const ProfileRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProfilePage();
    },
  );
}
