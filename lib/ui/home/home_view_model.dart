import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  int _currentIndex = 0;

  get currentIndex {
    return _currentIndex;
  }

  updateCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }
}
