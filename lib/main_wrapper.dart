import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:peak_it_2024_app/core/routes/router.gr.dart';

@RoutePage()
class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  void initState() {
    super.initState();
  }

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
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: tabsRouter.activeIndex == 1 ? BorderSide.none : BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 0.5,
                  )
                )
              ),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                currentIndex: tabsRouter.activeIndex,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                onTap: (value) {
                  tabsRouter.setActiveIndex(value);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Меню'),
                  // BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Акции'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: 'Корзина'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Профиль'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
