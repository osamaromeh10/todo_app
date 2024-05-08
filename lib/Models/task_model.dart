class TaskModel {
  String? id;
  String? title;
  String? Description;
  int? date;
  bool isDone;
  String userId;
  TaskModel({this.id = " ",
    required this.title,
    required this.Description,
    required this.date,
    this.isDone = false,
  required this.userId
  });

  TaskModel.fromJson(Map<String, dynamic> json) //Named Constructor
      : this(
      id: json['id'],
      title: json['title'],
      Description: json['Description'],
      date: json['date'],
      isDone: json['isDone'],
  userId: json['userId']
  );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "Description": Description,
      "date": date,
      "isDone": isDone,
      "userId":userId

    };
  }
}
