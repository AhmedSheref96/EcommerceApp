import 'package:e_commerce_app/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key, required this.model}) : super(key: key);

  final BannerModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white54,
          gradient: const LinearGradient(
              colors: [Color(0xff9696ff), Colors.blueGrey, Colors.brown])),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Text(
                  model.subTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              image: DecorationImage(
                  image: NetworkImage(model.imgUrl), fit: BoxFit.fitHeight),
            )),
          )
        ],
      ),
    );
  }
}
