import 'package:users_flutterapp/data/entity/users.dart';

class UserAnswer {
  List<Users> users;
  int success;

  UserAnswer({required this.users,required this.success});

  factory UserAnswer.fromJson(Map<String,dynamic> json){
    var jsonArray = json["kisiler"] as List;
    int success = json["success"] as int;

    var users = jsonArray.map((jsonArrayObj) => Users.fromJson(jsonArrayObj)).toList();

    return UserAnswer(user_id : json["kisi_id"] as String, user_name : json["kisi_ad"] as String,user_phone : json["kisi_tel"] as String)
  }
}