class TaskModel {
  String? id;
  String title;
  String description;
  bool isDone;

  TaskModel({
    this.id,
    required this.title,
    this.description = '',
    this.isDone = false,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'].toString(),
      title: map['title'],
      description: map['description'] ?? '',
      isDone: map['is_done'] ?? false,
    );
  }
}