import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ti_steps_task/blocks/internet_bloc/internet_bloc.dart';
import 'package:ti_steps_task/usage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>InternetBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: "SFPro",
            primarySwatch: Colors.deepOrange
        ),
        home: UserListPage(),
      ),
    );
  }
}
