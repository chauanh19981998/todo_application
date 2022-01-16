class Task {
  String id;
  String title;
  String detail;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.detail,
    this.isDone = false,
  });
}
