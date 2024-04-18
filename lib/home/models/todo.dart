class ToDo {
  final String title;
  DateTime creationDate;
  bool isDone;

  ToDo({
    required this.title,
    required this.isDone,
    required this.creationDate,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      title: json['title'],
      isDone: json['isDone'],
      creationDate: DateTime.parse(json['creationDate']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
      'creationDate': creationDate.toIso8601String(),
    };
  }
}
