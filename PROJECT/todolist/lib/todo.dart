class Todo {
  int? id;
  String? title;
  String? detail;
  bool status;

  Todo({this.id, this.title, this.detail, required this.status});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'detail': detail,
      'status': status ? 1 : 0
    };
    return map;
  }
}
