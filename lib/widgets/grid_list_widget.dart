import 'package:e_commerce_app/widgets/list_item_widget.dart';
import 'package:flutter/material.dart';

class GridListWidget extends StatelessWidget {
  const GridListWidget(
      {Key? key,
      required this.label,
      required this.scrollDirection,
      // required this.listItemWidget,

      required this.listLength,
      required this.dataList,
        required this.onClicked})
      : super(key: key);

  final int listLength;
  final String label;
  final Axis scrollDirection;
  // final ListItemWidget listItemWidget;
  final List<dynamic> dataList;
  final Function(int?) onClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            scrollDirection: scrollDirection,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) =>
                ListItemWidget(itemModel: dataList[index],onClicked: (id) => onClicked(id),),
            itemCount: listLength,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .8,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),
        ],
      ),
    );
  }
}
