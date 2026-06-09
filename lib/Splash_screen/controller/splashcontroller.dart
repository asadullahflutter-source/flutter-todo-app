import 'dart:async';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    timer();
  }

  void timer() {
    Timer(const Duration(seconds: 3), () {
      Get.offNamed('/Login');
    });
  }
}