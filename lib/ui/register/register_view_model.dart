import 'package:get/get.dart';

class RegisterViewModel extends GetxController {
  String _userName = "";

  String _password = "";

  get userName => _userName;

  get password => _password;

  updateUserName(String user) {
    _userName = user;
    update();
  }

  updatePassword(String password) {
    _password = password;
    update();
  }
}
