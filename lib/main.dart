import 'package:e_commerce_app/binding/main_binding.dart';
import 'package:e_commerce_app/ui/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: "/register",
            page: () => const RegisterScreen(),
            binding: MainBinding())
      ],
      home: const RegisterScreen(),
    );
  }
}
