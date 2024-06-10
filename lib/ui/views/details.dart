import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_flutterapp/data/entity/users.dart';
import 'package:users_flutterapp/ui/cubit/detailscubit.dart';

class Details extends StatefulWidget {
  Users user;

  Details({required this.user});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var tf_usersName = TextEditingController();
  var tf_userPhone = TextEditingController();


  @override
  void initState() {
    super.initState();
    var user = widget.user;
    tf_usersName.text = user.user_name;
    tf_userPhone.text = user.user_phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DETAILS"),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tf_usersName,
                decoration: const InputDecoration(hintText: "Username"),),
              TextField(controller: tf_userPhone,
                decoration: const InputDecoration(hintText: "Phone Number"),),
              ElevatedButton(onPressed: (){
                context.read<DetailsPage_Cubit>().UpdateUser(int.parse(widget.user.user_id),tf_usersName.text,tf_userPhone.text);
              }, child: const Text("UPDATE"),),
            ],
          ),
        ),
      ),
    );
  }
}
