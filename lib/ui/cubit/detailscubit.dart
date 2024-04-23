import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_flutterapp/data/repo/usersrepo.dart';

class DetailsPage_Cubit extends Cubit<void>{
  DetailsPage_Cubit():super(0);

  var krepo = UsersDaoRepository();

  Future<void> UpdateUser(int id,String name, String telephone) async{
    await krepo.UpdateUser(id, name, telephone);
  }
}