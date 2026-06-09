import 'package:flutter/material.dart';
import 'package:flutter_application_1/utlis/supabaseservice.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/state_manager.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class Signupcontroller extends GetxController {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  Future<void> signup(
    String name,
    String username,
    String email,
    String password,
  )
    async {
      try{

      final response = await SupabaseService.signup(
        name,
        username,
        email,
        password,

      );

      if (response.user != null) {
        Get.snackbar('Success', 'Account created successfully. Please log in.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        Get.offNamed('/login');
      }
    } on AuthException catch (e) {
      Get.snackbar('Signup Failed', e.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  @override
  void onClose() {
    namecontroller.dispose();
    usernamecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.onClose();
  }
}