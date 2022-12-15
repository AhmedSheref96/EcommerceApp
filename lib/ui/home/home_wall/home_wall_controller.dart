import 'package:e_commerce_app/data/home_repo.dart';
import 'package:e_commerce_app/models/banner_model.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';

class HomeWallController extends GetxController {
  HomeRepo repo = HomeRepo();
  String _searchText = "";

  List<BannerModel> banners = [
    BannerModel(
        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "Newest Products",
        "we have offer for you",
        4.5),
    BannerModel(
        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "Newest Products",
        "we have offer for you",
        4.5),
    BannerModel(
        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "Newest Products",
        "we have offer for you",
        4.5),
    BannerModel(
        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "Newest Products",
        "we have offer for you",
        4.5),
    BannerModel(
        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "Newest Products",
        "we have offer for you",
        4.5),
  ];

  List<CategoryModel> categories = [
    CategoryModel(
        "Men",
        "https://cdn-icons-png.flaticon.com/512/863/863684.png",
        "/men clothes",
        0xfffff1f),
    CategoryModel(
        "Women",
        "https://cdn-icons-png.flaticon.com/512/1785/1785255.png",
        "/Women clothes",
        0xfffff1f),
    CategoryModel(
        "Children",
        "https://cdn-icons-png.flaticon.com/512/2935/2935108.png",
        "/Children clothes",
        0xfffff1f),
    CategoryModel(
        "Kitchen",
        "https://cdn-icons-png.flaticon.com/512/1980/1980708.png",
        "/Kitchen",
        0xfffff1f),
    CategoryModel(
        "Beauty",
        "https://cdn-icons-png.flaticon.com/512/1005/1005667.png",
        "/Beauty",
        0xfffff1f),
    CategoryModel(
        "Electronics",
        "https://cdn-icons-png.flaticon.com/512/911/911514.png",
        "/Electronics",
        0xfffff1f),
    CategoryModel(
        "Accessories",
        "https://cdn-icons-png.flaticon.com/512/3050/3050154.png",
        "/Accessories",
        0xfffff1f),
  ];

  final RxList<ProductModel> _products = RxList();

  get searchText => _searchText;

  void updateSearchText(String value) {
    _searchText = value;
    update();
  }

  Future<List<ProductModel>> get products async {
    List<ProductModel> mProducts = await repo.getProducts();
    _products.clear();
    _products.addAll(mProducts);
    return _products;
  }

  Future<List<ProductModel>> get products2 async {
    List<ProductModel> mProducts = await repo.getProducts();
    _products.addAll(mProducts);
    return _products;
  }
}
