import 'package:flutter/material.dart';
import 'package:weather_app/src/config/themes/color.dart';
import 'package:weather_app/src/config/themes/icon_broken.dart';
import 'package:weather_app/src/modules/favorite/presentation/favorite_screen.dart';
import 'package:weather_app/src/modules/forecast/presentatin/forecast_screen.dart';
import 'package:weather_app/src/modules/home/presentation/home_screen.dart';
import 'package:weather_app/src/modules/setting/presentation/setting_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int index;
  late PageController _controller;

  List<Widget> screen = [
    const HomeScreen(),
    const ForecastScreen(),
    const FavoriteScreen(),
    const SettingScreen(),
  ];

  @override
  void initState() {
    super.initState();
    index = 0;
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade200,
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        onPageChanged: changeIndex,
        children: const <Widget>[
          HomeScreen(),
          ForecastScreen(),
          FavoriteScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 16),
        color: Colors.grey.shade200,
        child: CustomNavigationBar(
          backgroundColor: Colors.grey.shade300,
          selectedColor: selectedIconColor,
          unSelectedColor: unselectedIconColor,
          elevation: 0,
          isFloating: true,
          iconSize: 26,
          borderRadius: const Radius.circular(48),
          strokeColor: Colors.transparent,
          scaleCurve: Curves.easeOutCirc,
          currentIndex: index,
          onTap: changeIndex,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(IconBroken.Home),
            ),
            CustomNavigationBarItem(
              icon: const Icon(IconBroken.Document),
            ),
            CustomNavigationBarItem(
              icon: const Icon(IconBroken.Heart),
            ),
            CustomNavigationBarItem(
              icon: const Icon(IconBroken.Setting),
            ),
          ],
        ),
      ),
    );
  }

  changeIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
    _controller.jumpToPage(index);
  }
}
