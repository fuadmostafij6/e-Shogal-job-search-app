


import 'package:eshogal/screens/worker_dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkerJobDetails extends StatefulWidget {
  final String jobTitle;
  final String jobDetails;
  final String location;
  final String vacancy;
  final String salary;
  const WorkerJobDetails({Key? key, required this.jobTitle, required this.jobDetails, required this.location, required this.vacancy, required this.salary}) : super(key: key);

  @override
  State<WorkerJobDetails> createState() => _WorkerJobDetailsState();
}

class _WorkerJobDetailsState extends State<WorkerJobDetails> {
  int field =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: field==0?Text("JobDetails"):field==1?Text("Near Me"):field==2?Text("Profile"):field==3?Text("Setting"):Text("JobDetails"),

        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkerDashboardScreen()));
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
SizedBox(height: 20.0,),
          Padding(
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
                          "${widget.jobTitle}",
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
                              "${widget.location}",
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
                                " ${widget.salary}",
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
                    Column(
                      children: [
                        Text("Job Details:", style: TextStyle(
                            fontSize: 14,
                            color: Colors
                                .black,
                            fontWeight:
                            FontWeight
                                .bold),),
                        Text(widget.jobDetails, style: TextStyle(
                            fontSize: 14,
                            color: Colors
                                .black,
                            fontWeight:
                            FontWeight
                                .w400),),
                      ],
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
                        ),
                        Spacer(),
                        Text("Vacancy:",style: TextStyle(
                            fontSize: 14,
                            color: Colors
                                .black,
                            fontWeight:
                            FontWeight
                                .bold),),
                        SizedBox(width: 10.0,),

                        Text(widget.vacancy,
                            style:TextStyle(
                            fontSize: 14,
                            color: Colors
                                .black,
                            fontWeight:
                            FontWeight
                                .w400))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],),
      ),
    );
  }
}
