import 'package:e_commerce_app/ui/product_details/product_details_view_model.dart';
import 'package:get/get.dart';

class ProductDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsViewModel());
  }

}