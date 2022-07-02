import 'package:eshogal/login/loginwithemail.dart';
import 'package:eshogal/login/signup_screen.dart';
import 'package:eshogal/screens/creatjobScreen.dart';
import 'package:eshogal/screens/spalash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/employer_dashboard_screen.dart';
import 'screens/user_admin_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(


      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return


      GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:const SplashScreen22()
    );
  }
}


