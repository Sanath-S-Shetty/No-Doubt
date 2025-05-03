import 'package:flutter/material.dart';
import 'package:no_doubt/login.dart';

//import 'package:no_doubt/askdoubtpage.dart';

// import 'package:no_doubt/home.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const LoginPage(),
      home: LoginPage()
    );
  }
}

