
import 'package:eshogal/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
class LoginWithPhone extends StatefulWidget {
  final String verificationID;
  const LoginWithPhone({Key? key, required this.verificationID}) : super(key: key);

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
            SizedBox(
              height: size.height * 0.3,
            ),
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle),
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
                      "Verify OTP",
                      style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Put The OTP Send to Your Phone",
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 20.0,
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
                            return "your OTP number is empty";
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

                          hintText: "OTP (One Time Password)",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Colors.green[900],
                            fontSize: 24,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.bold,
                          ),

                          labelText: 'OTP',

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
                    TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashBoardScreen()));
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
                          child:const Center(child: Text("Login with phone", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),)),
                        )
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text("Resend OTP", style: TextStyle(color: Colors.green[800], fontSize: 24.0, fontWeight: FontWeight.bold),)
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
