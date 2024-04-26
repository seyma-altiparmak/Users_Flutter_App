import 'package:users_flutterapp/data/entity/users.dart';

class UsersDaoRepository{
  Future<void> Save(String name, String telephone) async{
    print("User : ${name}, ${telephone}");
  }
  Future<void> UpdateUser(int id,String name, String telephone) async{
    print("User updated : ${id}, ${name}, ${telephone}");
  }
  Future<void> delete(int id) async {
    print("delete : $id");
  }
  Future<List<Users>> userLoad() async {
    var userList = <Users>[];
    var k1 = Users(user_id: 1, user_phone: "532654852", user_name: "Aysel");
    var k2 = Users(user_id: 2, user_phone: "524528526", user_name: "Hamide");
    var k3 = Users(user_id: 3, user_phone: "2568596", user_name: "Saka Su");
    userList.add(k1);
    userList.add(k2);
    userList.add(k3);
    return userList;
  }
  Future<List<Users>> search(String searchWord) async {
    var userList = <Users>[];
    var k1 = Users(user_id: 1, user_phone: "532654852", user_name: "Aysel");
    userList.add(k1);
    return userList;
  }
}