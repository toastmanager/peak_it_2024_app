import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/core/routes/router.gr.dart';
import 'package:peak_it_2024_app/core/routes/routes.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            path: Routes.mainScreen,
            initial: true,
            page: MainWrapper.page,
            children: [
              AutoRoute(path: Routes.menu, page: MenuRoute.page),
              AutoRoute(path: Routes.cart, page: CartRoute.page),
              AutoRoute(path: Routes.profile, page: ProfileRoute.page),
            ]),
      ];
}
