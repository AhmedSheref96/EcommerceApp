import 'package:e_commerce_app/data/home_repo.dart';
import 'package:e_commerce_app/data/product_details_repo.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';

class ProductDetailsViewModel extends GetxController {
  final ProductDetailsRepo _repo = ProductDetailsRepo();
  final HomeRepo _homeRepo = HomeRepo();
  int commentsCount = 5;

  Future<ProductModel> getProductDetails(int id) async {
    var product = await _repo.getProductDetails(id);
    print("************** $product");
    return product;
  }

  showMore() {
    commentsCount = 20;
    print("*************** showMore $commentsCount");
    update();
  }
  showLess() {
    commentsCount = 5;
    print("*************** showLess $commentsCount");
    update();
  }

  Future<List<ProductModel>> getProducts(){
    var response = _homeRepo.getProducts();
    return response;
  }

}
