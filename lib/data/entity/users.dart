class Users{
  String user_id;
  String user_phone;
  String user_name;

  Users({required this.user_id,
    required this.user_phone,
    required this.user_name});

  factory Users.fromJson(Map<String,dynamic> json){
    return Users(user_id : json["kisi_id"] as String, user_name : json["kisi_ad"] as String,user_phone : json["kisi_tel"] as String);
  }
}