import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshogal/login/loginwithemail.dart';
import 'package:eshogal/screens/creatjobScreen.dart';
import 'package:eshogal/screens/editJobpost.dart';
import 'package:eshogal/screens/employer_job_candidate_screen.dart';
import 'package:eshogal/screens/job_details-screen.dart';
import 'package:eshogal/screens/profile_screen.dart';
import 'package:eshogal/screens/workerjobdetails.dart';
import 'package:eshogal/utils/my_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'applied_job_for_worker.dart';
import 'nearme.dart';

class WorkerDashboardScreen extends StatefulWidget {
  const WorkerDashboardScreen({Key? key}) : super(key: key);

  @override
  State<WorkerDashboardScreen> createState() => _WorkerDashboardScreenState();
}

class _WorkerDashboardScreenState extends State<WorkerDashboardScreen> {
  int field = 0;
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginWithEmail())));
  }

  Future<void> refresh() {
    return Future.delayed(const Duration(seconds: 2));
  }

  String? jobType;
  @override
  void initState() {
    MyPrefs.getToken().then((value) {
      setState(() {
        jobType = value;
      });
    });

    super.initState();

    nearByJobLitchenner();
  }

  nearByJobLitchenner() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("nearby_job")
        .where("read", isEqualTo: false)
        .snapshots()
        .listen((event) async {
      try {
        if (FirebaseAuth.instance.currentUser == null) {
          return;
        }
        DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore
            .instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();

        if (user['type'] != "worker") {
          return;
        }

        if (event.docs.isEmpty) {
          return;
        }
      } catch (e) {
        return;
      }
      var data = event.docs.first.data();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => WorkerJobDetails(
                    location: data["jobArea"],
                    vacancy: data["vacancy"],
                    jobDetails: data["Details"],
                    jobTitle: data["tile"],
                    salary: data["salary"],
                    jobId: data["job_post_id"],
                    postedBy: data["posted_by"],
                    lat: double.parse(data["lan"]),
                    long: double.parse(data["long"]),
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    var stream = FirebaseFirestore.instance.collection("job_post").snapshots();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: Icon(Icons.arrow_back)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Worker DashBoard"),
        backgroundColor: Colors.grey[800],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 14,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            child: ListView(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AppliedJob()));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                              border:
                                  Border.all(color: Colors.green, width: 4)),
                          height: 60,
                          width: 60,
                          child: Icon(
                            Icons.timelapse,
                            size: 40,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(child: Text("Applied Jobs"))
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // setState(()=>{
                        //   field = 0
                        // });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                              border:
                                  Border.all(color: Colors.green, width: 4)),
                          height: 60,
                          width: 60,
                          child: Icon(
                            Icons.date_range,
                            size: 40,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(child: Text("Monthly"))
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Profile());
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                              border:
                                  Border.all(color: Colors.green, width: 4)),
                          height: 60,
                          width: 60,
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(child: Text("Profile"))
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    _signOut();
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                              border:
                                  Border.all(color: Colors.green, width: 4)),
                          height: 60,
                          width: 60,
                          child: Icon(
                            Icons.logout,
                            size: 40,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(child: Text("LogOut"))
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 4,
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(120.0),
                  children: [
                    TableRow(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text('Job Title',
                                  style: TextStyle(fontSize: 20.0))
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text('Type', style: TextStyle(fontSize: 20.0))
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text('Salary', style: TextStyle(fontSize: 20.0))
                            ]),
                          ),
                        ]),
                  ],
                ),
              ),
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
                                  return ss.data!.docs[index]
                                              ["typeOfEmployment"] ==
                                          "Monthly"
                                      ? InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        WorkerJobDetails(
                                                          location: ss.data!
                                                                  .docs[index]
                                                              ["jobArea"],
                                                          vacancy: ss.data!
                                                                  .docs[index]
                                                              ["vacancy"],
                                                          jobDetails: ss.data!
                                                                  .docs[index]
                                                              ["Details"],
                                                          jobTitle: ss.data!
                                                                  .docs[index]
                                                              ["tile"],
                                                          salary: ss.data!
                                                                  .docs[index]
                                                              ["salary"],
                                                          jobId: ss.data!
                                                                  .docs[index]
                                                              ["job_post_id"],
                                                          postedBy: ss.data!
                                                                  .docs[index]
                                                              ["posted_by"],
                                                          long: double.parse(ss
                                                                  .data!
                                                                  .docs[index]
                                                              ["long"]),
                                                          lat: double.parse(ss
                                                                  .data!
                                                                  .docs[index]
                                                              ["lan"]),
                                                        )));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 20, right: 20, bottom: 5),
                                            child: Table(
                                              children: [
                                                TableRow(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                top: 8,
                                                                bottom: 8),
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                  ss.data!.docs[
                                                                          index]
                                                                      ["tile"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20.0))
                                                            ]),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                  ss.data!.docs[
                                                                          index]
                                                                      [
                                                                      "typeOfEmployment"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20.0))
                                                            ]),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 8.0,
                                                                top: 8.0,
                                                                bottom: 8.0,
                                                                left: 8.0),
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                  ss.data!.docs[
                                                                          index]
                                                                      [
                                                                      "salary"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20.0))
                                                            ]),
                                                      ),
                                                    ]),
                                              ],
                                            ),
                                          ),
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
        ],
      ),
    );
  }
}
