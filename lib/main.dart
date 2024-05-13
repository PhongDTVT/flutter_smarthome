import 'package:firebase_core/firebase_core.dart';
import 'package:home_iot/constants/app_colors.dart';
import 'package:home_iot/firebase/firebase_method.dart';
import 'package:home_iot/firebase_options.dart';
import 'package:home_iot/screen/smart_home.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.bgColor,
        fontFamily: "Popppins"
      ),
      home: const FirebaseMethod(),
      
    );
  }


  
}