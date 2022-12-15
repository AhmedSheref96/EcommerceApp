import 'package:e_commerce_app/ui/home/home_view_model.dart';
import 'package:get/get.dart';

import '../ui/home/search/search_view_model.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeViewModel());
    Get.put(SearchViewModel());
  }

}