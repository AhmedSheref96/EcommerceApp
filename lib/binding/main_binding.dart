import 'package:e_commerce_app/ui/register/register_view_model.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterViewModel());

  }
}
