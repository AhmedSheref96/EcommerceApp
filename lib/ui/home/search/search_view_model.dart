import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  String _searchText = "";

  get searchText => _searchText;

  final RxList<String> history = RxList(["ttttt", "jhhhhhhhh", "ddddddddd", "fgmdg", "sdfsdf","ttttt", "jhhhhhhhh", "ddddddddd", "fgmdg", "sdfsdf"]);

  void updateSearchText(String value) {
    _searchText = value;
    update();
  }

}
