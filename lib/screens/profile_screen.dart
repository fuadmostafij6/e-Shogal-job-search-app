import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshogal/login/loginwithemail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final firebaseUserUid = FirebaseAuth.instance.currentUser!.uid;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  List userDataList = [];
  CollectionReference profileEdit = FirebaseFirestore.instance.collection('users');
  fetchWorkerData() async {
    QuerySnapshot qn =
    await FirebaseFirestore.instance.collection("users").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        if (qn.docs[i]["uid"] == firebaseUserUid) {
          setState(() => {

            userDataList.add({
              "type":qn.docs[i]["type"],
              "lat":qn.docs[i]["lat"],
              "long":qn.docs[i]["long"],
            })
          });
        }
      }
    });

    return qn.docs;
  }
  Future<void> editJobPost( String profileName, String profilePhone) {

    final uid = FirebaseAuth.instance.currentUser!.uid;
    final profile =profileEdit.doc(firebaseUserUid);
    return profile
        .update({

      "name": profileName,
      "phone": profilePhone,
      "uid": firebaseUserUid,
      "type": userDataList[0]["type"],
      "lat": userDataList[0]["lat"],
      "long": userDataList[0]["long"]



    })
        .then((value) =>  Fluttertoast.showToast(
        msg: "Update Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0)
        .catchError((error) =>  Fluttertoast.showToast(
        msg: "Something Wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0)));
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginWithEmail())));
  }
  @override
  void initState() {
    super.initState();
    fetchWorkerData();
  }
  @override
  Widget build(BuildContext context) {

    var stream = FirebaseFirestore.instance.collection("users").snapshots();

    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text("Profile"),
        backgroundColor: Colors.grey[800],
        automaticallyImplyLeading: true,
      ),
      body:

      ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          StreamBuilder(
              stream: stream,
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> ss) {
                switch (ss.connectionState) {
                  case ConnectionState.done:

                  case ConnectionState.waiting:
                    return Center(
                      child: Text("wait"),
                    );
                  default:
                    if (ss.hasData) {
                      if (ss.data!.docs.length == 0) {
                        return Center(
                          child: Text("No data"),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: ss.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = ss.data!.docs[index];

                              return data["uid"] == firebaseUserUid
                                  ?

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                          BorderRadius.circular(
                                              10.0)),
                                      padding:
                                      const EdgeInsets.all(10.0),

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20.0,),

                                          Center(
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundColor: Colors.white,
                                              backgroundImage: AssetImage("assets/images/ll.png"),
                                            ),
                                          ),
                                          SizedBox(height: 20.0,),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("Name: ", style: const TextStyle(
                                                    fontSize: 17,
                                                    color: Colors
                                                        .black,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),),
                                                Text(ss.data!.docs[index]["name"].toString().toUpperCase(),style: const TextStyle(
                                                    fontSize:
                                                    14,
                                                    color: Colors
                                                        .black,
                                                    fontWeight:
                                                    FontWeight
                                                        .w400),),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("Phone: ", style: const TextStyle(
                                                    fontSize: 17,
                                                    color: Colors
                                                        .black,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),),
                                                Text(ss.data!.docs[index]["phone"].toString().toUpperCase(),style: const TextStyle(
                                                    fontSize:
                                                    14,
                                                    color: Colors
                                                        .black,
                                                    fontWeight:
                                                    FontWeight
                                                        .w400),),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("User Type: ", style: const TextStyle(
                                                    fontSize: 17,
                                                    color: Colors
                                                        .black,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),),
                                                Text(ss.data!.docs[index]["type"].toString().toUpperCase(),style: const TextStyle(
                                                    fontSize:
                                                    14,
                                                    color: Colors
                                                        .black,
                                                    fontWeight:
                                                    FontWeight
                                                        .w400),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),


                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      TextButton(
                                          style: TextButton.styleFrom(

                                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                              backgroundColor: Colors.green.shade900),
                                          onPressed: (){
                                            _signOut();
                                          }, child: Text("           Logout          ", style: TextStyle(color: Colors.white),)),
                                      SizedBox(width: 15.0,),
                                      TextButton(
                                          style: TextButton.styleFrom(

                                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                              backgroundColor: Colors.green.shade900),
                                          onPressed: (){
                                            showDialog(context: context, builder: (context){
                                              return AlertDialog(
                                                content: Form(
                                                  key: _formKey,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Text("Update Profile"),
                                                        SizedBox(height: 15.0,),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                                          child: TextFormField(
                                                            textAlign: TextAlign.center,
                                                            keyboardType: TextInputType.text,
                                                            controller: nameController,
                                                            validator: (val) {
                                                              if (val!.isEmpty) {
                                                                return "your name is empty";
                                                              }
                                                              return null;
                                                            },
                                                            enableSuggestions: true,
                                                            decoration: InputDecoration(
                                                              focusColor: Colors.white,
                                                              filled: true,
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Colors.grey, width: 1.0),
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
                                                                    nameController.text = ""
                                                                  });
                                                                },
                                                              ),

                                                              border: OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Colors.grey, width: 1.0),
                                                                borderRadius: BorderRadius.circular(10.0),
                                                              ),

                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Colors.grey, width: 1.0),
                                                                borderRadius: BorderRadius.circular(10.0),
                                                              ),
                                                              fillColor: Colors.white,

                                                              hintText: "Put Your Name Here",

                                                              //make hint text
                                                              hintStyle: TextStyle(
                                                                color: Colors.green[900],
                                                                fontSize: 18,
                                                                fontFamily: "verdana_regular",
                                                                fontWeight: FontWeight.bold,
                                                              ),

                                                              labelText: 'Your Name',

                                                              labelStyle: TextStyle(
                                                                color: Colors.green[900],
                                                                fontSize: 18,
                                                                fontFamily: "verdana_regular",
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15.0,),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                                          child: TextFormField(
                                                            textAlign: TextAlign.center,
                                                            keyboardType: TextInputType.text,
                                                            controller: phoneController,
                                                            validator: (val) {
                                                              if (val!.isEmpty) {
                                                                return "your Phone is empty";
                                                              }
                                                              return null;
                                                            },
                                                            enableSuggestions: true,
                                                            decoration: InputDecoration(
                                                              focusColor: Colors.white,
                                                              filled: true,
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Colors.grey, width: 1.0),
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
                                                                    phoneController.text = ""
                                                                  });
                                                                },
                                                              ),

                                                              border: OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Colors.grey, width: 1.0),
                                                                borderRadius: BorderRadius.circular(10.0),
                                                              ),

                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Colors.grey, width: 1.0),
                                                                borderRadius: BorderRadius.circular(10.0),
                                                              ),
                                                              fillColor: Colors.white,

                                                              hintText: "Put Your Phone Here",

                                                              //make hint text
                                                              hintStyle: TextStyle(
                                                                color: Colors.green[900],
                                                                fontSize: 18,
                                                                fontFamily: "verdana_regular",
                                                                fontWeight: FontWeight.bold,
                                                              ),

                                                              labelText: 'Your Phone',

                                                              labelStyle: TextStyle(
                                                                color: Colors.green[900],
                                                                fontSize: 18,
                                                                fontFamily: "verdana_regular",
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15.0,),
                                                        TextButton(
                                                            style: TextButton.styleFrom(

                                                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                backgroundColor: Colors.green.shade900),
                                                            onPressed: (){
                                                              editJobPost(nameController.text, phoneController.text);


                                                            }, child: Text("           Update          ", style: TextStyle(color: Colors.white),)),

                                                      ],
                                                    ),
                                                  ),

                                                ),
                                              );
                                            });

                                          }, child: Text("           Update          ", style: TextStyle(color: Colors.white),)),
                                    ],
                                  )

                                ],
                              )

                                  : SizedBox();
                            });
                      }
                    } else {
                      return Text("");
                    }
                }
              }),
        ],
      ),
    );
  }
}