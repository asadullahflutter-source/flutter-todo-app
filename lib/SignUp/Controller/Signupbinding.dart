import 'package:flutter_application_1/SignUp/Controller/Signupcontroller.dart';
import 'package:get/get.dart';

class Signupbinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Signupcontroller>(()=>Signupcontroller());
  }

}