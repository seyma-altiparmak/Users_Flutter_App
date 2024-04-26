import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_flutterapp/data/entity/users.dart';
import 'package:users_flutterapp/data/repo/usersrepo.dart';

class HomePage_Cubit extends Cubit<List<Users>>{
  HomePage_Cubit():super(<Users>[]);

  var krepo = UsersDaoRepository();

  Future<void> userLoad() async {
    var list = await krepo.userLoad();
    emit(list);
  }

  Future<void> search(String searchWord) async {
    var list = await krepo.search(searchWord);
    emit(list);
  }

  Future<void> delete(int id) async {
    await krepo.delete(id);
    await userLoad();
  }
}