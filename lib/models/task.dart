class Task {
  final String title;
  bool isDone;


  Task({
    required this.title,
    this.isDone = false,
  }); 

  Task copyWith({String? title, bool? isDone}) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isDone: json['isDone'],
    );
  }
}