import 'package:e_commerce_app/theme/colors.dart';
import 'package:e_commerce_app/ui/home/cart/cart_screen.dart';
import 'package:e_commerce_app/ui/home/for_you/for_you_screen.dart';
import 'package:e_commerce_app/ui/home/home_view_model.dart';
import 'package:e_commerce_app/ui/home/home_wall/home_wall_screen.dart';
import 'package:e_commerce_app/ui/home/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final menuItems = [
    const BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/home.png")),
      label: "home",
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/vector.png")),
      label: "for you",
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/bag.png")),
      label: "cart",
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/profile.png")),
      label: "profile",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: _bottomNavBar(controller),
        body: _screen(controller),
      ),
    );
  }

  _bottomNavBar(HomeViewModel controller) {
    return BottomNavigationBar(
      items: menuItems,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      currentIndex: controller.currentIndex,
      onTap: (value) {
        controller.updateCurrentIndex(value);
      },
    );
  }

  _screen(HomeViewModel controller) {
    switch (controller.currentIndex) {
      case 0:
        return HomeWallScreen();
      case 1:
        return ForYouScreen();
      case 2:
        return CartScreen();
      case 3:
        return ProfileScreen();
    }
  }
}
