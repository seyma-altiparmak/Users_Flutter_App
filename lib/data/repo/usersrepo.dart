import 'package:users_flutterapp/data/entity/users.dart';
import 'package:users_flutterapp/sqlite/databasehelper.dart';

class UsersDaoRepository{
  Future<void> Save(String name, String telephone) async{
    var db = await DatabaseHelper.databaseAccess();
    var newUser = Map<String,dynamic>();

    newUser["user_name"] = name;
    newUser["user_phone"] = telephone;

    await db.insert("Users", newUser);
  }
  Future<void> UpdateUser(int id,String name, String telephone) async{
    var db = await DatabaseHelper.databaseAccess();
    var updatedUser = Map<String,dynamic>();

    updatedUser["user_name"] = name;
    updatedUser["user_phone"] = telephone;

    await db.update("Users", updatedUser, where: "user_id = ?", whereArgs: [id]);
  }
  Future<void> delete(int id) async {
    var db = await DatabaseHelper.databaseAccess();
    await db.delete("Users", where: "user_id = ?", whereArgs: [id]);
  }
  Future<List<Users>> userLoad() async {
    var db = await DatabaseHelper.databaseAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Users");

    return List.generate((maps.length), (i)
    {
      var row = maps[i];
      return Users(user_id: row["user_id"], user_phone: row["user_phone"], user_name: row["user_name"]);
    });
  }
  Future<List<Users>> search(String searchWord) async {
    var db = await DatabaseHelper.databaseAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Users WHERE user_name LIKE '%$searchWord%'");

    return List.generate((maps.length), (i)
    {
      var row = maps[i];
      return Users(user_id: row["user_id"], user_phone: row["user_phone"], user_name: row["user_name"]);
    });
  }
}