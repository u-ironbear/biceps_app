class User {
  final String id;
  final String email;
  final String name;
  final String age;
  final String gender;
  final String trackRecord;
  String avatar;

  //TODO Возможно стоит добавить startDate

  User({
    this.id,
    this.email,
    this.name,
    this.age,
    this.gender,
    this.trackRecord,
    this.avatar,
  });

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        email = data['email'],
        name = data['name'],
        age = data['age'],
        gender = data['gender'],
        trackRecord = data['track_record'],
        avatar = data['avatar'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'age': age,
      'gender': gender,
      'track_record': trackRecord,
      'avatar': avatar,
    };
  }
}
