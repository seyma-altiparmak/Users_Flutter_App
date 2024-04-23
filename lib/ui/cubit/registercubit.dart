import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_flutterapp/data/repo/usersrepo.dart';

class RegisterPage_Cubit extends Cubit<void>{
  RegisterPage_Cubit():super(0);

  var krepo = UsersDaoRepository();

  Future<void> Save(String name, String telephone) async{
    krepo.Save(name, telephone);
  }
}