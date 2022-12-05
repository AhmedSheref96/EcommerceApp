import 'package:e_commerce_app/ui/register/register_view_model.dart';
import 'package:e_commerce_app/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<RegisterViewModel> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(top: 80),
              child: const Text(
                "Register",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            const SizedBox(height: 30),
            const Text("welcome to your app."),
            const SizedBox(height: 80,),
            InputWidget(
              label: "user name",
              value: controller.userName,
              onChanged: (value) => controller.updateUserName(value),
            ),
            const SizedBox(height: 30),
            InputWidget(
              label: "password",
              value: controller.userName,
              onChanged: (value) => controller.updateUserName(value),
            ),
          ],
        ),
      ),
    );
  }
}
