import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:peak_it_2024_app/core/routes/router.gr.dart';

@RoutePage()
class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsRouter(
          routes: const [
              MenuRoute(),
              CartRoute(),
              ProfileRoute(),
          ],
          builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            return Scaffold(
              body: child,
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  onTap: (value) {
                    tabsRouter.setActiveIndex(value);
                  },
                  items: const [
                      BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Меню'),
                      // BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Акции'),
                      BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Корзина'),
                      BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Профиль'),
                  ],
              ),
            );
          },
      ),
    );
  }
}