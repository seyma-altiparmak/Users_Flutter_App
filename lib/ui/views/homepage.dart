import 'package:flutter/material.dart';
import 'package:users_flutterapp/ui/views/register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("USERS"),),
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
              const RegisterPage())).then((value) =>
              print("NOW : Homepage"),);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
