import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({Key? key, required this.itemModel, required this.onClicked, this.height, this.width}) : super(key: key);

  final dynamic itemModel;
  final Function(int?) onClicked;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    Widget renderedWidget;
    if (itemModel is ProductModel) {
      renderedWidget = ProductWidget(productModel: itemModel,onClicked: (id) => onClicked(id),width: width,height: height,);
    } else {
      renderedWidget = const SizedBox();
    }
    return Container(
      child: renderedWidget,
    );
  }
}
