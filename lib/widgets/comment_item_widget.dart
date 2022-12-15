import 'package:e_commerce_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentItemWidget extends StatelessWidget {
  const CommentItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/610/610120.png"),
            backgroundColor: primaryColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "now",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                RatingBarIndicator(
                  itemBuilder: (context, index) {
                    return const Icon(Icons.star, color: Colors.yellowAccent);
                  },
                  rating: 3.5,
                  itemCount: 5,
                  itemSize: 14,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  maxLines: 8,
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
