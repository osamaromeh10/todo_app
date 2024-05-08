class userModel {
  String id;
  String name;
  String email;
  int age;

  userModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.age});

  userModel.fromjson(Map<String, dynamic> json) //Named Constructor
      : this(
          id: json['id'],
          name: json['name'],
          email: json['email'],
          age: json['age'],
        );

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "age": age,
    };
  }
}
