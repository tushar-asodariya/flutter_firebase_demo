import 'controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_demo/core/app_export.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
                children: [
      FittedBox(
        child: Image.asset(ImageConstant.imgBuilding),
      )
    ])));
  }
}
