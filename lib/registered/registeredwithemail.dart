
import 'package:eshogal/main.dart';
import 'package:eshogal/screens/dashboard_screen.dart';
import 'package:eshogal/screens/employer_dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login/loginwithemail.dart';
import '../login/loginwithphone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RegisteredWithEmail extends StatefulWidget {
  const RegisteredWithEmail({Key? key}) : super(key: key);

  @override
  State<RegisteredWithEmail> createState() => _RegisteredWithEmailState();
}

class _RegisteredWithEmailState extends State<RegisteredWithEmail> {
  final GlobalKey<NavigatorState> navigatorKey =
   GlobalKey<NavigatorState>();


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String worker = "";
  String employee = "";
  final _formKey = GlobalKey<FormState>();
  bool? reg;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String uid, String? name, String type){

    return users
        .doc(uid)
        .set({
      'uid': uid,
      'name': name,
      'type': type
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  Future signUp() async{

    reg = false;
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim()).then((value) =>{

        addUser(value.user!.uid,value.user!.displayName, worker==""?employee: worker)

      }




    );
      reg = true;
    }
       on FirebaseAuthException catch (e){

         setState(()=>{
         reg = false
         });
         showDialog(context: context, builder: (context)=>Center(
           child: Text(e.toString()),
         ));

      print(e);
       }

    // Future.delayed(Duration.zero).then((_) {
    //   Navigator.pop(context);
    // });
    //
if(reg==true){
  Future.delayed(Duration.zero).then((_) {
    Navigator.push(context,MaterialPageRoute(builder:(context)=> const EmployerDashBoardScreen()));
  });
}

  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [

            Center(
              child: Container(
                height: size.height * 0.3,
                width: size.width*0.9-10,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Registered With E-mail",
                      style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Use Your E-mail, Password to Registered",
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (val) {  bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!);
                        if (emailValid == false) {
                          return "your email number is not valid";
                        } else if (val.isEmpty) {
                          return "your email number is empty";
                        }
                        return null;
                        },
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          filled: true,

                          //add prefix icon


                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Colors.white,

                          hintText: "Put Your E-mail Here",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Colors.green[900],
                            fontSize: 24,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.bold,
                          ),

                          labelText: 'Your E-mail',

                          labelStyle: TextStyle(
                            color: Colors.green[900],
                            fontSize: 24,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "your password is empty";
                          }
                          else if(val.length<6){
                            return "Password must be 6 digit";

                          }
                          return null;
                        },
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          filled: true,

                          //add prefix icon
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() => {
                                FocusScope.of(context).unfocus(),
                                passwordController.text = ""
                              });
                            },
                          ),

                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Colors.white,

                          hintText: "Put Your Password Here",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Colors.green[900],
                            fontSize: 24,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.bold,
                          ),

                          labelText: 'Your Password',

                          labelStyle: TextStyle(
                            color: Colors.green[900],
                            fontSize: 24,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "your password is empty";
                          }
                          return null;
                        },
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          filled: true,

                          //add prefix icon
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() => {
                                FocusScope.of(context).unfocus(),
                                passwordController.text = ""
                              });
                            },
                          ),

                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Colors.white,

                          hintText: "Put Your Password Here",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Colors.green[900],
                            fontSize: 24,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.bold,
                          ),

                          labelText: 'Your Password',

                          labelStyle: TextStyle(
                            color: Colors.green[900],
                            fontSize: 24,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: size.width*0.85-10,
                      height: 100,
                      decoration:  const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))

                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Radio(value: "Radio", groupValue: worker, onChanged: (value){



                                setState(()=>{
                                  worker = value.toString()

                                });

                              }),
                              const Text("Worker")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(value: "Employee", groupValue: employee, onChanged: (value){

                                setState(()=>{
employee = value.toString()                                });

                              }),
                              const Text("Employee")
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            signUp();
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 20, bottom: 20),
                          backgroundColor: Colors.green[800],
                        ),
                        child:reg ==null? SizedBox(
                          height: 30,
                          width: size.width*0.7,
                          child:const Center(child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),)),
                        ):SizedBox(
                          height: 30,
                          width: size.width*0.7,
                          child:const Center(child: CircularProgressIndicator(),),
                        )
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginWithEmail()));
                        },

                        child: Text("Login With Email", style: TextStyle(color: Colors.green[800], fontSize: 20.0, fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),)

                    ),
                    const SizedBox(height: 10.0,),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginWithEmail()));
                        },

                        child: Text("Login With Phone", style: TextStyle(color: Colors.green[800], fontSize: 20.0, fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),)

                    ),

                    const SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
