import 'package:flutter_application_1/todo_list/controller/todocontroller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class TodoScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoScreenController>(() => TodoScreenController());
  }
}