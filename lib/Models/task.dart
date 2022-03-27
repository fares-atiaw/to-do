class Task {
  String? id;
  String? title;
  String? description;
  int? dateTime;
  bool? isDone;

  Task(
      {this.id = "",
      required this.title,
      required this.description,
      required this.dateTime,
      this.isDone = false});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'isDone': isDone
    };
  }

  Task.fromJson(Map<String, dynamic> jason)
      : this(
          id: jason['id'],
          title: jason['title'],
          description: jason['description'],
          dateTime: jason['dateTime'],
          isDone: jason['isDone'],
        );
}

/// Task : {"id":"id","title":"title","description":"description","dateTime":"dateTime","isDone":"isDone"}

/// id : "id"
/// title : "title"
/// description : "description"
/// dateTime : "dateTime"
/// isDone : "isDone"