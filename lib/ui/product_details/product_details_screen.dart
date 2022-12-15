import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/theme/colors.dart';
import 'package:e_commerce_app/ui/product_details/product_details_view_model.dart';
import 'package:e_commerce_app/widgets/button_widget.dart';
import 'package:e_commerce_app/widgets/grid_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/comment_item_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ProductDetailsViewModel>(
        builder: (controller) =>
            SingleChildScrollView(
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FutureBuilder(
                    future: controller.getProductDetails(productId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            _productImages(snapshot.requireData),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  _productMainDetails(snapshot.requireData),
                                  const SizedBox(height: 10),
                                  _sellerAccount(snapshot.requireData),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "comments",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  if (controller.commentsCount == 20 &&
                                      index == 19) {
                                    return Column(
                                      children: [
                                        const CommentItemWidget(),
                                        const SizedBox(height: 10),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: ButtonWidget(
                                            title: "show less",
                                            onpressed: () =>
                                                controller.showLess(),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else if (controller.commentsCount == 5 &&
                                      index == 4) {
                                    return Column(
                                      children: [
                                        const CommentItemWidget(),
                                        const SizedBox(height: 10),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: ButtonWidget(
                                            title: "show more",
                                            onpressed: () =>
                                                controller.showMore(),
                                          ),
                                        )
                                      ],
                                    );
                                  } else {
                                    return const CommentItemWidget();
                                  }
                                },
                                separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                                itemCount: controller.commentsCount),
                          ],
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  FutureBuilder(
                    future: controller.getProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridListView(
                          label: "similar products",
                          scrollDirection: Axis.horizontal,
                          listLength: 5,
                          dataList: snapshot.requireData,
                          itemHeight: 500,
                          itemWidth: 300,
                          viewHeight: 800,
                          viewWidth: Get.width,
                          onClicked: (p0) {},
                        );
                      } else {
                        return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),);
                      }
                    },
                  )
                ],
              ),
            ),
      ),
    );
  }

  _productImages(ProductModel product) {
    return FadeInImage.assetNetwork(
        placeholder: 'assets/images/loading.gif',
        image: product.image ??
            "https://erasmusnation-com.ams3.digitaloceanspaces.com/woocommerce-placeholder.png");
  }

  _productMainDetails(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title ?? "",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.price.toString(),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.redAccent,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star, color: Colors.yellowAccent, size: 12),
                const SizedBox(width: 10),
                Text(
                  product.rating?.rate?.toString() ?? "0",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "${product.rating?.count} Reviews",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0x0f3a9b7a),
              ),
              child: const Text(
                "sales : 85",
                style: TextStyle(
                  color: Color(0xff3a9b7A),
                  fontSize: 10,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  _sellerAccount(ProductModel productModel) {
    return GestureDetector(
      onTap: () =>
          Get.snackbar(
            "snackbar",
            "snackbar",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
          ),
      child: SizedBox(
        height: 100,
        child: Card(
          elevation: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: primaryColor,
                  backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/5556/5556468.png"),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ahmed Sheref",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("Verified"),
                          Icon(
                            Icons.verified_user_rounded,
                            color: Colors.greenAccent,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
