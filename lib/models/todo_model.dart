class TodoModel {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  bool isCompleted;

  TodoModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.description,
    this.isCompleted = false,
  });

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: title ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
