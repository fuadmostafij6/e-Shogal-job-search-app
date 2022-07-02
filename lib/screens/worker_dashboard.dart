


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshogal/screens/creatjobScreen.dart';
import 'package:eshogal/screens/editJobpost.dart';
import 'package:eshogal/screens/employer_job_candidate_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WorkerDashboardScreen extends StatefulWidget {
  const WorkerDashboardScreen({Key? key}) : super(key: key);

  @override
  State<WorkerDashboardScreen> createState() => _WorkerDashboardScreenState();
}

class _WorkerDashboardScreenState extends State<WorkerDashboardScreen> {
  CollectionReference jobPost = FirebaseFirestore.instance.collection('job_post');

  List jobList = [];
  fetchMyJob() async {
    QuerySnapshot qn1 = await jobPost.get();

    for (int j=0; j <qn1.docs.length; j++ ){
      QuerySnapshot  qn = await  jobPost.doc(qn1.docs[j].id).collection("my_job").get();
      for (int i = 0; i < qn.docs.length; i++) {
        setState(()  {

          jobList.add({
            "job_post_id": qn.docs[i]["job_post_id"],
            "uid": qn.docs[i]["uid"],
            "publish": qn.docs[i]["publish"],
            "tile": qn.docs[i]["tile"],
            "Details": qn.docs[i]["Details"],
            "typeOfEmployment": qn.docs[i]["typeOfEmployment"],
            "jobArea": qn.docs[i]["jobArea"],
            "lan": qn.docs[i]["lan"],
            "long": qn.docs[i]["long"],
            "deadline": qn.docs[i]["deadline"],
            "joining": qn.docs[i]["joining"],
            "salary": qn.docs[i]["salary"],
            "vacancy": qn.docs[i]["vacancy"],
          });
        });

      }
    }




    return jobList;
  }
  Future<void> refresh() {
    jobList.clear();
    fetchMyJob();
    return Future.delayed(const Duration(seconds: 2));
  }
  @override
  void initState() {
    fetchMyJob();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchMyJob();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Worker DashBoard"),
        backgroundColor: Colors.grey[800],
      ),
      body: RefreshIndicator(
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
                          refresh();
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
                          child: Icon(Icons.pin_drop,size: 40,color: Colors.green[800],),

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
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>CreateJobScreen()));
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
                      SizedBox(height: 5,),

                      Center(child: Text("Settings"))
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 24,),

            SizedBox(height: 24,),
            jobList.isEmpty? Center(child: CircularProgressIndicator(),):
            Expanded(

                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: jobList.length,
                  itemBuilder: (_,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(_, MaterialPageRoute(builder: (_)=> const EmployerJobCandidateScreen()));
                      },
                      child: Padding(
                        padding:  const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("${jobList[index]["tile"]}",style: const TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),


                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        const Text("Location :",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                                        const SizedBox(width: 10,),
                                        Text("${jobList[index]["jobArea"]}",style: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),)
                                      ],
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 28.0),
                                      child: Row(
                                        children: [
                                          const Text("Salary :",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                                          const SizedBox(width: 10,),
                                          Text(" ${jobList[index]["salary"]}",style: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),

                                Row(
                                  children: [
                                    Text("Posted By :",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Text("Abir hasan",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ))

          ],
        ),
      ),
    );
  }
}
