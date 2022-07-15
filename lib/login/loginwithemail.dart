import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshogal/screens/employer_dashboard_screen.dart';
import 'package:eshogal/utils/my_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../registered/registeredwithemail.dart';
import '../screens/worker_dashboard.dart';
import 'loginwithphone.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List userDataList = [];
  bool buttonLoading = false;
  fetchWorkerData(String uid) async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection("users").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        if (qn.docs[i]["uid"] == uid) {
          setState(() => {

            qn.docs[i]["type"] == "employee"
                ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EmployerDashBoardScreen()))
                : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WorkerDashboardScreen())),
                //
                // userDataList.add({
                //
                //   // "name": qn.docs[i]["name"],
                //   // "phone": qn.docs[i]["phone"],
                //   // "uid": qn.docs[i]["uid"],
                //   // "type":qn.docs[i]["type"]
                // })
              });
        }
      }
    });

    return qn.docs;
  }

  Future signIn() async {
    setState(()=>buttonLoading=true);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) => {

                if (value.user!.uid.isNotEmpty)
                  {
                    fetchWorkerData(value.user!.uid),
                    MyPrefs.setToken(FirebaseAuth.instance.currentUser!.uid),
                    setState(()=>buttonLoading=false),
                    Fluttertoast.showToast(
                        msg: "Login Successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green[800],
                        textColor: Colors.white,
                        fontSize: 16.0)
                  }
              });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: "Something wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(e);
    }

    // Future.delayed(Duration.zero).then((_) {
    //   Navigator.pop(context);
    // });
    //
  }
  @override
  void initState() {
  userDataList.clear();

    super.initState();
  }
  @override
  void dispose() {
   userDataList.clear();
    // ignore: avoid_print
    print('Dispose used');
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green[900],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
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
                      "Login with E-mail",
                      style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 24.0,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Give Your Email & Password to Login",
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
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (val) {
                          bool emailValid = RegExp(
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
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                          //add prefix icon

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

                          hintText: "Put Your E-mail Here",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Colors.green[900],
                            fontSize: 18,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.bold,
                          ),

                          labelText: 'Your E-mail',

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
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
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
                            fontSize: 18,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.bold,
                          ),

                          labelText: 'Your Password',

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
                            signIn();
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 20, bottom: 20),
                          backgroundColor: Colors.green[800],
                        ),
                        child: SizedBox(
                          height: 30,
                          width: size.width * 0.7,
                          child: buttonLoading?Center(child: CircularProgressIndicator()):const Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0),
                          )),
                        )),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisteredWithEmail()));
                        },
                        child: Text(
                          "Registered With Email",
                          style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    InkWell(
                        child: Text(
                      "Registered With Phone",
                      style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    )),
                    const SizedBox(
                      height: 20.0,
                    )
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
