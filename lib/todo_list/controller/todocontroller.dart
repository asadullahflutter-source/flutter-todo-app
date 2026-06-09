import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_list/model/taskmodel.dart';
import 'package:flutter_application_1/utlis/supabaseservice.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodoScreenController extends GetxController {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController(); // NEW
  var tasks = <TaskModel>[].obs;
  var isLoading = false.obs;

  final supabase = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      isLoading(true);
      final userId = supabase.auth.currentUser!.id;
      final response = await supabase
          .from('tasks')
          .select()
          .eq('user_id', userId)
          .order('created_at');

      tasks.value = (response as List).map((e) => TaskModel.fromMap(e)).toList();
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }

  Future<void> addTask() async {
    if (taskController.text.trim().isEmpty) return;
    try {
      final userId = supabase.auth.currentUser!.id;
      final response = await supabase.from('tasks').insert({
        'title': taskController.text.trim(),
        'description': descriptionController.text.trim(), // NEW
        'is_done': false,
        'user_id': userId,
      }).select().single();

      tasks.add(TaskModel.fromMap(response));
      taskController.clear();
      descriptionController.clear(); // NEW
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> toggleTask(int index, bool? value) async {
    try {
      await supabase
          .from('tasks')
          .update({'is_done': value})
          .eq('id', tasks[index].id!);

      tasks[index].isDone = value!;
      tasks.refresh();
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> deleteTask(int index) async {
    try {
      await supabase.from('tasks').delete().eq('id', tasks[index].id!);
      tasks.removeAt(index);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> logout() async {
    await SupabaseService.logout();
    Get.offAllNamed('/login');
  }

  @override
  void onClose() {
    taskController.dispose();
    descriptionController.dispose(); // NEW
    super.onClose();
  }
}