class Task {
  final int id;
  final String title;
  bool isDone;


  Task({
    required this.id,
    required this.title,
    this.isDone = false,
  }); 

  Task copyWith({int? id, String? title, bool? isDone}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'title': title,
      'isDone': isDone,
    };
  }

  factory Task.create(String title) {
    return Task(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      isDone: json['isDone'],
    );
  }
}