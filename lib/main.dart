
import 'package:eshogal/screens/spalash_screen.dart';
import 'package:eshogal/utils/my_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login/signup_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(


      const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String ?id;

  @override
  void initState() {
    MyPrefs.getToken().then((value) {
      id= value;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return


      GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginSignupScreen()
    );
  }
}


