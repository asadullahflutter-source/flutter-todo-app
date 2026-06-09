import 'package:flutter_application_1/Login_Screen/controller/logincontroller.dart';
import 'package:get/get.dart';

class Loginbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Logincontroller>(() => Logincontroller());
  }
}