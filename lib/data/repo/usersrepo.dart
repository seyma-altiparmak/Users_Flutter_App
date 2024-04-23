class UsersDaoRepository{
  Future<void> Save(String name, String telephone) async{
    print("User : ${name}, ${telephone}");
  }
}