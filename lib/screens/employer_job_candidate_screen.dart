
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshogal/screens/user_admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

class EmployerJobCandidateScreen extends StatefulWidget {
  final String jobTitle;
  final String jobPostId;

  const EmployerJobCandidateScreen({Key? key, required this.jobTitle, required this.jobPostId}) : super(key: key);

  @override
  State<EmployerJobCandidateScreen> createState() => _EmployerJobCandidateScreenState();
}

class _EmployerJobCandidateScreenState extends State<EmployerJobCandidateScreen> {
  @override
  Widget build(BuildContext context) {
    var stream = FirebaseFirestore.instance.collection("apply").snapshots();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Employer JobCandidate"),
        backgroundColor: Colors.grey[800],
      ),
      body: Column(
        children: [

          SizedBox(height: 24,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
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
                        child: Icon(Icons.list,size: 40,color: Colors.green[800],),

                      ),
                    ),
                    SizedBox(height: 5,),
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
                            border: Border.all(color: Colors.green,width: 4)
                        ),
                        height: 60,
                        width: 60,
                        child: Icon(Icons.book,size: 40,color: Colors.green[800],),

                      ),
                    ),
                    SizedBox(height: 5,),
                    Center(child: Text("Open Jobs"))
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
                            border: Border.all(color: Colors.green,width: 4)
                        ),
                        height: 60,
                        width: 60,
                        child: Icon(Icons.book,size: 40,color: Colors.green[800],),

                      ),
                    ),
                    SizedBox(height: 5,),
                    Center(child: Text("Create jobs"))
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
                            border: Border.all(color: Colors.green,width: 4)
                        ),
                        height: 60,
                        width: 60,
                        child: Icon(Icons.settings,size: 40,color: Colors.green[800],),

                      ),
                    ),
                    const SizedBox(height: 5,),

                    const Center(child: Text("Settings"))
                  ],
                ),
              ),

            ],
          ),
          const SizedBox(height: 24,),

          const Text("Application On",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
          const SizedBox(height: 14,),
           Text(widget.jobTitle,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
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

                                  return data["job_post_id"] == widget.jobPostId
                                      ? GestureDetector(
                                    onTap: () {

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
                                                  Text("Name:",style: const TextStyle(
                                                      fontSize: 17,
                                                      color: Colors
                                                          .black,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold)),
                                                  SizedBox(width:15.0 ,),
                                                  Text(
                                                    "${ss.data!.docs[index]["worker_name"]}",
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
                                              SizedBox(height: 20.0,),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Text("Phone:",style: const TextStyle(
                                                      fontSize: 17,
                                                      color: Colors
                                                          .black,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold)),
                                                  SizedBox(width:15.0 ,),
                                                  TextButton(
                                                    child: Text("${ss.data!.docs[index]["worker_phone"]}", style: const TextStyle(
                                                        fontSize: 17,
                                                        color: Colors
                                                            .black,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold)),
                                                    onPressed: () {
                                                      launchUrl("tel://21213123123");
                                                    },
                                                  ),

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


        ],
      ),
    );

  }
  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
