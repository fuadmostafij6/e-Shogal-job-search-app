import 'package:flutter/material.dart';

class AdminDashBoardScreen extends StatefulWidget {
  const AdminDashBoardScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashBoardScreen> createState() => _AdminDashBoardScreenState();
}

class _AdminDashBoardScreenState extends State<AdminDashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admin Dashboard"),
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
                    Center(child: Text("All Job"))
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
                        child: Icon(Icons.person_outline,size: 40,color: Colors.green[800],),

                      ),
                    ),
                    SizedBox(height: 5,),
                    Center(child: Text("Users"))
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
                    Center(child: Text("Post Jonbs"))
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
                    SizedBox(height: 5,),

                    Center(child: Text("Settings"))
                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 14,),
          Text("Review Post Job",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 14,),

          Expanded(child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 5,
            itemBuilder: (_,context){
              return GestureDetector(
                onTap: (){
                },
                child: Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                         color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abir Hasan",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text("Location :",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                                  SizedBox(width: 10,),
                                  Text("Badda Link Road ",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),)
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 28.0),
                                child: Row(
                                  children: [
                                    Text("Salary :",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Text("40000 ",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),)
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
    );
  }
}
