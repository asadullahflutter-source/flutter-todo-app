import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_list/controller/todocontroller.dart';
import 'package:get/get.dart';

class TodoScreen extends GetView<TodoScreenController> {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0F),
        elevation: 0,
        title: const Text(
          'My Tasks',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: Icon(Icons.logout_rounded,
                color: Colors.white.withOpacity(0.6)),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // ── Task Name Field ─────────────────
            _inputField(
              ctrl: controller.taskController,
              hint: 'Task name',
              icon: Icons.task_alt_rounded,
            ),

            const SizedBox(height: 10),

            // ── Description Field + Add Button ──
            Row(
              children: [
                Expanded(
                  child: _inputField(
                    ctrl: controller.descriptionController,
                    hint: 'Description (optional)',
                    icon: Icons.notes_rounded,
                  ),
                ),
                const SizedBox(width: 10),

                // Add button
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7C6FFF), Color(0xFF5B4FE8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF7C6FFF).withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: controller.addTask,
                    icon: const Icon(Icons.add_rounded,
                        color: Colors.white, size: 26),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ── Task List ───────────────────────
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF7C6FFF),
                      strokeWidth: 2.5,
                    ),
                  );
                }

                if (controller.tasks.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inbox_rounded,
                          size: 72, color: Colors.white.withOpacity(0.15)),
                      const SizedBox(height: 16),
                      Text(
                        'No tasks yet',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ],
                  );
                }

                return ListView.builder(
                  itemCount: controller.tasks.length,
                  itemBuilder: (context, index) {
                    final task = controller.tasks[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: task.isDone
                            ? Colors.white.withOpacity(0.03)
                            : Colors.white.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: task.isDone
                              ? Colors.white.withOpacity(0.05)
                              : const Color(0xFF7C6FFF).withOpacity(0.25),
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        leading: Checkbox(
                          value: task.isDone,
                          onChanged: (value) =>
                              controller.toggleTask(index, value),
                          activeColor: const Color(0xFF7C6FFF),
                          checkColor: Colors.white,
                          side: BorderSide(
                              color: Colors.white.withOpacity(0.3),
                              width: 1.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            color: task.isDone
                                ? Colors.white.withOpacity(0.3)
                                : Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            decoration: task.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        // Description shown only if not empty
                        subtitle: task.description.isNotEmpty
                            ? Text(
                                task.description,
                                style: TextStyle(
                                  color: task.isDone
                                      ? Colors.white.withOpacity(0.15)
                                      : Colors.white.withOpacity(0.4),
                                  fontSize: 12,
                                  decoration: task.isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  decorationColor:
                                      Colors.white.withOpacity(0.2),
                                ),
                              )
                            : null,
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline_rounded,
                              color: Colors.white.withOpacity(0.3), size: 20),
                          onPressed: () => controller.deleteTask(index),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // ── Reusable input field ──────────────────
  Widget _inputField({
    required TextEditingController ctrl,
    required String hint,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: TextField(
        controller: ctrl,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        cursorColor: const Color(0xFF7C6FFF),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.3), size: 20),
          hintText: hint,
          hintStyle:
              TextStyle(color: Colors.white.withOpacity(0.25), fontSize: 14),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}