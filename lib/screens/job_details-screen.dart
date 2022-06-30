
import 'package:eshogal/screens/near_me_screen.dart';
import 'package:flutter/material.dart';

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({Key? key}) : super(key: key);

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Job Details"),
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
                        child: Icon(Icons.book,size: 40,color: Colors.green[800],),

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
                        child: Icon(Icons.location_on_outlined,size: 40,color: Colors.green[800],),

                      ),
                    ),
                    SizedBox(height: 5,),

                    Center(child: Text("Near Me"))
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

                    Center(child: Text("My Profile"))
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 14,),

      Padding(
        padding: const EdgeInsets.all(8.0),
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
                Text("App Developer",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
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

                SizedBox(height: 30,),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=> NearMeScreen() ));

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 38.0,right: 30),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green[800],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 40,
                    width: double.infinity,
                    child: Text("Apply Job",style: TextStyle(fontSize: 17,color: Colors.white),),
                    ),
                  ),
                ),                SizedBox(height: 10,),


              ],
            ),
          ),
        ),
      ),
        ],
      ),
    );
  }
}
