


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshogal/screens/creatjobScreen.dart';
import 'package:eshogal/screens/editJobpost.dart';
import 'package:eshogal/screens/employer_job_candidate_screen.dart';
import 'package:eshogal/screens/workerjobdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WorkerDashboardScreen extends StatefulWidget {
  const WorkerDashboardScreen({Key? key}) : super(key: key);

  @override
  State<WorkerDashboardScreen> createState() => _WorkerDashboardScreenState();
}

class _WorkerDashboardScreenState extends State<WorkerDashboardScreen> {
  int field = 0;
  Future<void> refresh() {

    return Future.delayed(const Duration(seconds: 2));
  }
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var stream = FirebaseFirestore.instance.collection("job_post").snapshots();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: field==0?Text("Worker DashBoard"):field==1?Text("Near Me"):field==2?Text("Profile"):field==3?Text("Setting"):Text("Worker DashBoard"),
        backgroundColor: Colors.grey[800],
      ),
      body:
      RefreshIndicator(
        onRefresh: refresh,
        child: Column(
          children: [

            const SizedBox(height: 24,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                         setState(()=>{
                           field = 0
                         });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.green,width: 4)
                            ),
                            height: 60,
                            width: 60,
                            child: Icon(Icons.date_range,size: 40,color: Colors.green[800],),

                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Center(child: Text("Monthly"))
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(()=>{
                            field = 1
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.green,width: 4)
                            ),
                            height: 60,
                            width: 60,
                            child: Icon(Icons.pin_drop,size: 40,color: Colors.green[800],),

                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Center(child: Text("Near Me"))
                    ],
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(()=>{
                        field = 2
                      });
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.green,width: 4)
                            ),
                            height: 60,
                            width: 60,
                            child: Icon(Icons.person,size: 40,color: Colors.green[800],),

                          ),
                        ),
                        SizedBox(height: 5,),
                        Center(child: Text("Profile"))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(()=>{
                            field = 3
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),

                                color: Colors.grey[200],
                                border: Border.all(color: Colors.green,width: 4)
                            ),
                            height: 60,
                            width: 60,
                            child: Icon(Icons.settings,size: 40,color: Colors.green[800],),

                          ),
                        ),
                      ),
                      SizedBox(height: 5,),

                      Center(child: Text("Settings"))
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 24,),

            SizedBox(height: 24,),
            StreamBuilder(
                stream: stream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>ss){

                  switch(ss.connectionState){
                    case ConnectionState.done:

                    case ConnectionState.waiting:
                      return Center(child: Text("wait"),);
                    default:
                      if(ss.hasData){
                        if(ss.data!.docs.length==0){
                          return Center(child: Text("No data"),);

                        }

                        else{
                          return Expanded(child: ListView.builder(
                              itemCount: ss.data!.docs.length,
                              itemBuilder: (context, index){

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                         WorkerJobDetails(location: ss.data!.docs[index]["jobArea"], vacancy: ss.data!.docs[index]["vacancy"], jobDetails: ss.data!.docs[index]["Details"], jobTitle: ss.data!.docs[index]["tile"], salary: ss.data!.docs[index]["salary"],



                                        )));
                              },
                              child: Padding(
                                padding:
                                const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.0)),
                                  padding:
                                  const EdgeInsets.all(10.0),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 8.0, top: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "${ss.data!.docs[index]["tile"]}",
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  color: Colors
                                                      .black,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),

                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "Location :",
                                                  style: TextStyle(
                                                      fontSize:
                                                      14,
                                                      color: Colors
                                                          .black,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "${ss.data!.docs[index]["jobArea"]}",
                                                  style: const TextStyle(
                                                      fontSize:
                                                      14,
                                                      color: Colors
                                                          .black,
                                                      fontWeight:
                                                      FontWeight
                                                          .w400),
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding:
                                              const EdgeInsets
                                                  .only(
                                                  right:
                                                  28.0),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    "Salary :",
                                                    style: TextStyle(
                                                        fontSize:
                                                        14,
                                                        color: Colors
                                                            .black,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    " ${ss.data!.docs[index]["salary"]}",
                                                    style: const TextStyle(
                                                        fontSize:
                                                        14,
                                                        color: Colors
                                                            .black,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Posted By :",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors
                                                      .black,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Abir hasan",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors
                                                      .black,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }));
                        }
                      }
                      else{
                        return Text("");
                      }

                  }

            })


          ],
        ),
      ),
    );
  }
}
