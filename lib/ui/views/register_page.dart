import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_flutterapp/ui/cubit/registercubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var tf_usersName = TextEditingController();
  var tf_userPhone = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("REGISTER"),),
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
                context.read<RegisterPage_Cubit>().Save(tf_usersName.text, tf_userPhone.text);
              }, child: const Text("SAVE"),),
            ],
          ),
        ),
      ),
    );
  }
}
