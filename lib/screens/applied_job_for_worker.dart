import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshogal/screens/workerjobdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppliedJob extends StatefulWidget {
  const AppliedJob({Key? key}) : super(key: key);

  @override
  State<AppliedJob> createState() => _AppliedJobState();
}

class _AppliedJobState extends State<AppliedJob> {
  @override
  Widget build(BuildContext context) {
    var stream = FirebaseFirestore.instance.collection("apply").snapshots();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Applied Jobs"),
        backgroundColor: Colors.grey[800],
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0,),
          Container(
            margin: EdgeInsets.only(
                left: 20, right: 20, bottom: 5),
            child: Table(
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
                      child: Text(""),
                    );
                  default:
                    if (ss.hasData) {
                      if (ss.data!.docs.length == 0) {
                        return Center(
                          child: Text(""),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: ss.data!.docs.length,
                            itemBuilder: (context, index) {
                              var stream2 = FirebaseFirestore.instance.collection("job_post").snapshots();
                              return ss.data!.docs[index]
                              ["uid"] ==
                                  FirebaseAuth.instance.currentUser!.uid
                                  ? InkWell(
                                onTap: () {

                                },
                             child:  StreamBuilder(
                                 stream: stream2,
                                 builder:
                                     (BuildContext context, AsyncSnapshot<QuerySnapshot> ss1) {
                                   switch (ss1.connectionState) {
                                     case ConnectionState.done:

                                     case ConnectionState.waiting:
                                       return Center(
                                         child: Text("wait"),
                                       );
                                     default:
                                       if (ss1.hasData) {
                                         if (ss1.data!.docs.length == 0) {
                                           return Center(
                                             child: Text("No data"),
                                           );
                                         } else {
                                           return ListView.builder(
                                               shrinkWrap: true,
                                               primary: false,
                                               itemCount: ss1.data!.docs.length,
                                               itemBuilder: (context, index1) {
                                                 return ss1.data!.docs[index1]
                                                 ["job_post_id"] ==
                                                     ss.data!.docs[index]
                                                     ["job_post_id"]
                                                     ? InkWell(
                                                   onTap: () {

                                                   },
                                                   child:InkWell(
                                                     onTap: () {
                                                       Navigator.push(
                                                           context,
                                                           MaterialPageRoute(
                                                               builder: (_) =>
                                                                   WorkerJobDetails(
                                                                     location: ss1.data!
                                                                         .docs[index1]
                                                                     ["jobArea"],
                                                                     vacancy: ss1.data!
                                                                         .docs[index1]
                                                                     ["vacancy"],
                                                                     jobDetails: ss1.data!
                                                                         .docs[index1]
                                                                     ["Details"],
                                                                     jobTitle: ss1.data!
                                                                         .docs[index1]
                                                                     ["tile"],
                                                                     salary: ss1.data!
                                                                         .docs[index1]
                                                                     ["salary"],
                                                                     jobId: ss1.data!
                                                                         .docs[index1]
                                                                     ["job_post_id"],
                                                                     postedBy: ss1.data!
                                                                         .docs[index1]
                                                                     ["posted_by"],
                                                                     long: double.parse(ss1
                                                                         .data!
                                                                         .docs[index1]
                                                                     ["long"]),
                                                                     lat: double.parse(ss1
                                                                         .data!
                                                                         .docs[index1]
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
                                                                             ss1.data!.docs[
                                                                             index1]
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
                                                                             ss1.data!.docs[
                                                                             index1]
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
                                                                             ss1.data!.docs[
                                                                             index1]
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
                                                 )
                                                     : SizedBox();
                                               });
                                         }
                                       } else {
                                         return Text("");
                                       }
                                   }
                                 }),
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
