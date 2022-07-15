import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'loginwithemail.dart';
import 'loginwithphone.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  bool otp = false;
  String verificationID = "";
  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("SIgnUp");
         setState(()=>{
           otp = true,
         });

        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print("${e.message}error");
      },
      codeSent: (String verificationId, int? resendToken) {

        verificationID = verificationId;
        setState(() {

        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationID = verificationId;
        setState(() {});
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0,right: 39),
              child: Center(
                child: Image.asset("assets/images/logo.png",fit: BoxFit.contain,),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              height: 350,
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
                      "Get Started!",
                      style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Put Your Phone Number to Login or Register",
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(

                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "your Phone number is empty";
                          }
                          return null;
                        },
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          filled: true,
                          // prefixIcon: Padding(
                          //   padding: const EdgeInsets.only(top: 12.0,right: 6),
                          //   child: Text("+966",style: TextStyle(fontSize: 18,color: Colors.black),),
                          // ),

                          //add prefix icon
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() => {
                                    FocusScope.of(context).unfocus(),
                                    phoneController.text = ""
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

                          hintText: "OTP will be send",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Colors.green[900],
                            fontSize: 18,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.bold,
                          ),

                          labelText: 'Phone Number',

                          labelStyle: TextStyle(
                            color: Colors.green[900],
                            fontSize: 18,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          loginWithPhone();

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  LoginWithPhone(verificationID: verificationID,)));

                        }
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 20, bottom: 20),
                        backgroundColor: Colors.green[800],
                      ),
                      child: SizedBox(
                        height: 30,
                        width: size.width*0.7,
                        child:const Center(child: Text("Login/Signup", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),)),
                      )
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginWithEmail()));
                        },

                          child: Text("Login With E-mail", style: TextStyle(color: Colors.green[800], fontSize: 24.0, fontWeight: FontWeight.bold),)),

                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
