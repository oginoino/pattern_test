class Message {
  int? _userId;
  int? _id;
  String? _title;
  bool? _completed;

  Message({int? userId, int? id, String? title, bool? completed}) {
    if (userId != null) {
      _userId = userId;
    }
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (completed != null) {
      _completed = completed;
    }
  }

  Message.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _completed = json['completed'];
  }

  String? get title => _title;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = _userId;
    data['id'] = _id;
    data['title'] = _title;
    data['completed'] = _completed;
    return data;
  }
}
