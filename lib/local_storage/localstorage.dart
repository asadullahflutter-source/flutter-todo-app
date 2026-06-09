// import 'package:flutter_application_1/SignUp/models/SignUpmodel.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Localstorage {
//   static final String _keyEmail ="auth_email";
//   static final String _keyPassword ="auth_password";
//   static final String _keyIsloggedIn ="auth_isloggedin";

// static Future<void> setdata(Signupmodel user) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString(_keyEmail, user.email);
//   await prefs.setString(_keyPassword, user.password);
  
// }
// static Future<bool> getdata({required String email,required String password}) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final String? Semail = prefs.getString(_keyEmail);
//   final String? Spassword = prefs.getString(_keyPassword);
//  if(Semail == email && Spassword == password){
//   return true;
//  }
//   return false;
// }
// static Future<void> setlogin(bool isloggedin) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setBool(_keyIsloggedIn, isloggedin);

// }
// static Future<bool> getlogin() async {
//   final prefs = await SharedPreferences.getInstance();
//   return prefs.getBool(_keyIsloggedIn) ?? false;
// }
// }