import 'package:e_commerce_app/theme/colors.dart';
import 'package:e_commerce_app/ui/home/cart/cart_screen.dart';
import 'package:e_commerce_app/ui/home/favorites/favorites_screen.dart';
import 'package:e_commerce_app/ui/home/home_view_model.dart';
import 'package:e_commerce_app/ui/home/home_wall/home_wall_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeViewModel> {
  HomeScreen({Key? key}) : super(key: key);

  final menuItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: "home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline),
      label: "favorites",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: "cart",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      body: _screen(),
    );
  }

  _bottomNavBar() {
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

  _screen() {
    switch (controller.currentIndex) {
      case 0:
        return HomeWallScreen();
      case 1:
        return FavoritesScreen();
      case 1:
        return CartScreen();
    }
  }
}
