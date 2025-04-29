import 'package:core/core.dart';
import 'package:favourites/favourites.dart';
import 'package:flutter/material.dart';
import 'package:images/images.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const <PageRouteInfo>[
        ImagesRoute(),
        FavouritesRoute(),
      ],
      builder: (BuildContext tabContext, Widget child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(tabContext);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: context.tr('titles.images'),
                icon: const Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: context.tr('titles.favourites'),
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
        );
      },
    );
  }
}
