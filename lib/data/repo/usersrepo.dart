class UsersDaoRepository{
  Future<void> Save(String name, String telephone) async{
    print("User : ${name}, ${telephone}");
  }
  Future<void> UpdateUser(int id,String name, String telephone) async{
    print("User updated : ${id}, ${name}, ${telephone}");
  }
}