import 'package:e_commerce_app/ui/home/home_screen.dart';
import 'package:e_commerce_app/ui/register/register_view_model.dart';
import 'package:e_commerce_app/widgets/button_widget.dart';
import 'package:e_commerce_app/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../binding/home_binding.dart';
import '../../theme/colors.dart';

class RegisterScreen extends GetWidget<RegisterViewModel> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    SizedBox(height: 30),
                    Text("welcome to your app."),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
                Column(
                  children: [
                    InputWidget(
                      label: "user name",
                      value: controller.userName,
                      onChanged: (value) => controller.updateUserName(value),
                    ),
                    const SizedBox(height: 30),
                    InputWidget(
                      label: "password",
                      value: controller.password,
                      onChanged: (value) => controller.updatePassword(value),
                      isSecured: true,
                    ),
                    const SizedBox(height: 30),
                    ButtonWidget(
                      title: "SignIn",
                      icon: const Icon(Icons.done),
                      onpressed: () {
                        Get.offAll(HomeScreen(), binding: HomeBinding());
                      },
                    )
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Text(
                        "Sign Up".toUpperCase(),
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
