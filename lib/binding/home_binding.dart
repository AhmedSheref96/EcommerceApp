import 'package:e_commerce_app/ui/home/home_view_model.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeViewModel());
  }

}