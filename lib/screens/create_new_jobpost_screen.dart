import 'package:flutter/material.dart';

class CreateJobPostScreen extends StatefulWidget {
  const CreateJobPostScreen({Key? key}) : super(key: key);

  @override
  State<CreateJobPostScreen> createState() => _CreateJobPostScreenState();
}

class _CreateJobPostScreenState extends State<CreateJobPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create New Job Post"),
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
                    Center(child: Text("All Jobs"))
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
                    Center(child: Text("Post jobs"))
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
                    Center(child: Text("By Me"))
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
                    Center(child: Text("Create Jobs"))
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

          Text("Post Your Job Details Below",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
          SizedBox(height: 14,),


        ],
      ),
    );
  }
}
