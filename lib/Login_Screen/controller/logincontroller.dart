import 'package:flutter/material.dart';
import 'package:flutter_application_1/utlis/supabaseservice.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Logincontroller extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
Future<void> login() async {
  try {
    final response = await SupabaseService.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (response.user != null) {
      Get.offAllNamed('/todo');
    }
  } on AuthException catch (e) {
    Get.snackbar('Login Failed', e.message,
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

    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }}




























  //   // Step 2: simple validation to check if fields are not empty.
  //   if (username.isEmpty || email.isEmpty || password.isEmpty) {
  //     Get.snackbar(
  //       'Missing Data',
  //       'Please enter username, email and password.',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     return;
  //   }

  //   final bool isValid = await Localstorage.getdata(
  //     email: email,
  //     password: password,
  //   );

  //   if (!isValid) {
  //     Get.snackbar(
  //       'Invalid Credentials',
  //       'Please check your email and password.',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     return;
  //   }

  //   await Localstorage.setlogin(true);

  //   Get.offNamed('/to');
  //   Get.snackbar('Success', 'Logged in as $username');

  //   usernameController.clear();
  //   emailController.clear();
  //   passwordController.clear();
  // }

  // Future<void> login() async {
  //   // Step 1: get input values from text controllers.
  //   final username = usernameController.text.trim();
  //   final email = emailController.text.trim();
  //   final password = passwordController.text.trim();

  //   // Step 2: simple validation to check if fields are not empty.
  //   if (username.isEmpty || email.isEmpty || password.isEmpty) {
  //     Get.snackbar(
  //       'Missing Data',
  //       'Please enter username, email and password.',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     return;
  //   }

  //   final bool isValid = await Localstorage.getdata(
  //     email: email,
  //     password: password,
  //   );

  //   if (!isValid) {
  //     Get.snackbar(
  //       'Invalid Credentials',
  //       'Please check your email and password.',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     return;
  //   }

  //   await Localstorage.setlogin(true);

  //   Get.offNamed('/to');
  //   Get.snackbar('Success', 'Logged in as $username');

  //   usernameController.clear();
  //   emailController.clear();
  //   passwordController.clear();
  // }

//   @override
//   void onClose() {
    
//     usernameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     super.onClose();
//   }
// }