import 'package:e_commerce_app/binding/product_details_binding.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/theme/colors.dart';
import 'package:e_commerce_app/ui/product_details/product_details_screen.dart';
import 'package:e_commerce_app/widgets/banner_widget.dart';
import 'package:e_commerce_app/widgets/home_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/grid_list_widget.dart';
import '../search/search_screen.dart';
import 'home_wall_controller.dart';

class HomeWallScreen extends StatelessWidget {
  HomeWallScreen({Key? key}) : super(key: key);

  final HomeWallController controller = Get.put(HomeWallController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _topBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _searchBar(),
            GetBuilder<HomeWallController>(
              builder: (controller) => Column(
                children: [
                  _bannerView(controller),
                  _categoriesView(controller),
                  FutureBuilder(
                    future: controller.products,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridListWidget(
                          dataList: snapshot.requireData,
                          listLength: snapshot.requireData.length,
                          scrollDirection: Axis.vertical,
                          label: "Featured",
                          onClicked: (id) {
                            Get.to(ProductDetailsScreen(productId: id ?? 1),binding: ProductDetailsBinding());
                          },
                        );
                      } else {
                        return Container(
                            alignment: Alignment.center,
                            height: 100,
                            child: const CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _topBar() {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      elevation: .2,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage("assets/images/Notification.png"),
              color: primaryColor,
            )),
        IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage("assets/images/cart.png"),
              color: primaryColor,
            ))
      ],
      title: Container(
        transformAlignment: Alignment.center,
        child: const Text("Wall"),
      ),
    );
  }

  _searchBar() {
    return GestureDetector(
      onTap: () => Get.to(SearchScreen()),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: SearchWidget(
          hint: "Search",
          onPressed: () {
            print("clicked ***************************");
            // Get.to(const SearchScreen());
          },
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  _bannerView(HomeWallController controller) {
    return SizedBox(
      height: 150,
      width: Get.width,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return BannerWidget(model: controller.banners[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 30,
            );
          },
          itemCount: 5),
    );
  }

  _categoriesView(HomeWallController controller) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: const Text(
              "Categories",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _categoriesListView(controller),
        ],
      ),
    );
  }

  _categoriesListView(HomeWallController controller) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              _categoryItem(controller.categories[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemCount: 7),
    );
  }

  _categoryItem(CategoryModel model) {
    return SizedBox(
      height: 120,
      width: 120,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(model.color)),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(model.icon),
                height: 35,
                width: 35,
              ),
              const SizedBox(height: 8),
              Text(model.name)
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
