

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login_Screen/controller/loginbinding.dart';
import 'package:flutter_application_1/Login_Screen/views/login_screen.dart';
import 'package:flutter_application_1/SignUp/Controller/Signupbinding.dart';
import 'package:flutter_application_1/SignUp/views/Signupview.dart';
import 'package:flutter_application_1/Splash_screen/controller/splashbinding.dart';
import 'package:flutter_application_1/Splash_screen/views/SplashScreen.dart';

import 'package:flutter_application_1/todo_list/controller/binding.dart';
import 'package:flutter_application_1/todo_list/views/todo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );
  runApp(
   Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
   debugShowCheckedModeBanner: false,
   initialRoute: "/",
    getPages: [
      GetPage
      (name: "/",
       page: () => Splashscreen(),
       binding: SplashBinding()),
       GetPage
       (name: "/signup",
        page: () =>Signupscreen(),
        binding:Signupbinding() ),
       GetPage
       (name: "/Login",
        page: () => LoginScreen(),
        binding:Loginbinding() ),
        GetPage
        (name: "/todo",
         page: () => TodoScreen(),
         binding: TodoScreenBinding() ),
        ]
    );
  }
} 