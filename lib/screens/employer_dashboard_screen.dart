import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshogal/screens/creatjobScreen.dart';
import 'package:eshogal/screens/editJobpost.dart';
import 'package:eshogal/screens/employer_job_candidate_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmployerDashBoardScreen extends StatefulWidget {
  const EmployerDashBoardScreen({Key? key}) : super(key: key);

  @override
  State<EmployerDashBoardScreen> createState() =>
      _EmployerDashBoardScreenState();
}

class _EmployerDashBoardScreenState extends State<EmployerDashBoardScreen> {
  CollectionReference jobPost =
      FirebaseFirestore.instance.collection('job_post');
  final firebaseUserUid = FirebaseAuth.instance.currentUser!.uid;
  deleteJob(String id) async {
    jobPost.doc(id).delete();
  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => Navigator.pop(context));
  }
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
        title: Text("Employer DashBoard"),
        backgroundColor: Colors.grey[800],
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          refresh();
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
                              Icons.list,
                              size: 40,
                              color: Colors.green[800],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(child: Text("By me"))
                    ],
                  ),
                ),
                Expanded(
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
                            Icons.book,
                            size: 40,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(child: Text("Open Jobs"))
                    ],
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CreateJobScreen()));
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
                              Icons.book,
                              size: 40,
                              color: Colors.green[800],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(child: Text("Create jobs"))
                      ],
                    ),
                  ),
                ),
                Expanded(
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
                            Icons.settings,
                            size: 40,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(child: Text("Settings"))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Job Posted By Me",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 24,
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
                          return Expanded(
                              child: ListView.builder(
                                  itemCount: ss.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    var data = ss.data!.docs[index];

                                    return data["uid"] == firebaseUserUid
                                        ? GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                           EmployerJobCandidateScreen( jobTitle: ss.data!.docs[index]["tile"], jobPostId: ss.data!.docs[index]["job_post_id"],)));
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
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => EditJobPost(
                                                                                  job: ss.data!.docs[index]["typeOfEmployment"],
                                                                                  deadlineDate: ss.data!.docs[index]["deadline"],
                                                                                  joiningDate: ss.data!.docs[index]["joining"],
                                                                                  area: ss.data!.docs[index]["jobArea"],
                                                                                  postId: ss.data!.docs[index]["job_post_id"],
                                                                                  count: ss.data!.docs[index]["vacancy"],
                                                                                  title: ss.data!.docs[index]["tile"],
                                                                                  salary: ss.data!.docs[index]["salary"],
                                                                                  details: ss.data!.docs[index]["Details"], lon:ss.data!.docs[index]["long"] , lan: ss.data!.docs[index]["lan"],
                                                                                )));
                                                                  },
                                                                  child: const Text(
                                                                      "Edit")),
                                                              ss.data!.docs[index]
                                                                          [
                                                                          "publish"] ==
                                                                      true
                                                                  ? const Text(
                                                                      "publish")
                                                                  : const Text(
                                                                      "unpublished"),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    deleteJob(ss
                                                                            .data!
                                                                            .docs[index]
                                                                        [
                                                                        "job_post_id"]);
                                                                    refresh();
                                                                  },
                                                                  child: const Text(
                                                                      "Delete")),
                                                            ],
                                                          )
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
                                                            "Me",
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
                                          )
                                        : SizedBox();
                                  }));
                        }
                      } else {
                        return Text("");
                      }
                  }
                }),


            TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.fromLTRB(20, 15, 20, 15), backgroundColor: Colors.green.shade900),
                onPressed: (){
                  _signOut();
                  
                }, child: Text("Logout", style: TextStyle(color: Colors.white),))
            // jobList.isEmpty? Center(child: CircularProgressIndicator(),):
            // Expanded(
            //
            //     child: ListView.builder(
            //   shrinkWrap: true,
            //   primary: false,
            //   itemCount: jobList.length,
            //   itemBuilder: (_,index){
            //     return GestureDetector(
            //       onTap: (){
            //         Navigator.push(_, MaterialPageRoute(builder: (_)=> const EmployerJobCandidateScreen()));
            //       },
            //       child: Padding(
            //         padding:  const EdgeInsets.all(8.0),
            //         child: Container(
            //           decoration: BoxDecoration(
            //               color: Colors.grey[200],
            //               borderRadius: BorderRadius.circular(10.0)
            //           ),
            //           padding: const EdgeInsets.all(10.0),
            //           child: Padding(
            //             padding: const EdgeInsets.only(left: 8.0,top: 10),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Text("${jobList[index]["tile"]}",style: const TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
            //                  Row(
            //                    mainAxisAlignment: MainAxisAlignment.center,
            //                    children: [
            //                      TextButton(onPressed: (){
            //                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditJobPost(job: jobList[index]["typeOfEmployment"], deadlineDate: jobList[index]["deadline"], joiningDate: jobList[index]["joining"], area: jobList[index]["jobArea"], postId: jobList[index]["job_post_id"], count: jobList[index]["vacancy"], title: jobList[index]["tile"], salary: jobList[index]["salary"], details: jobList[index]["Details"],)));
            //
            //                      }, child: const Text("Edit")),
            //                      jobList[index]["publish"]== true? const Text("publish"): const Text("unpublished"),
            //                      TextButton(onPressed: (){
            //
            //                        deleteJob(jobList[index]["job_post_id"]);
            //                        refresh();
            //                      }, child: const Text("Delete")),
            //                    ],
            //                  )
            //
            //                 ],
            //               ),
            //                 const SizedBox(height: 10,),
            //                 Row(
            //                   children: [
            //                     Row(
            //                       children: [
            //                         const Text("Location :",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
            //                         const SizedBox(width: 10,),
            //                         Text("${jobList[index]["jobArea"]}",style: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),)
            //                       ],
            //                     ),
            //                     const Spacer(),
            //                     Padding(
            //                       padding: const EdgeInsets.only(right: 28.0),
            //                       child: Row(
            //                         children: [
            //                           const Text("Salary :",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
            //                           const SizedBox(width: 10,),
            //                           Text(" ${jobList[index]["salary"]}",style: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),)
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(height: 10,),
            //
            //                 Row(
            //                   children: [
            //                     Text("Posted By :",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
            //                     SizedBox(width: 10,),
            //                     Text("Abir hasan",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),)
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ))
          ],
        ),
      ),
    );
  }
}
