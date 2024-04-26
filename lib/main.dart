import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_flutterapp/ui/cubit/detailscubit.dart';
import 'package:users_flutterapp/ui/cubit/homepagecubit.dart';
import 'package:users_flutterapp/ui/cubit/registercubit.dart';
import 'package:users_flutterapp/ui/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterPage_Cubit()),
        BlocProvider(create: (context) => DetailsPage_Cubit()),
        BlocProvider(create: (context) => HomePage_Cubit()),
      ],
      child: MaterialApp(
        title: 'User App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}