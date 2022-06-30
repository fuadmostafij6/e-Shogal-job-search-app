import 'package:flutter/material.dart';

class UserAdminScreen extends StatefulWidget {
  const UserAdminScreen({Key? key}) : super(key: key);

  @override
  State<UserAdminScreen> createState() => _UserAdminScreenState();
}

class _UserAdminScreenState extends State<UserAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Admin"),
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
                    Center(child: Text("Post Jobs"))
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
          Text("List All User",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abir Hasan",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                          Spacer(),

                          Text("Edit",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                          SizedBox(width: 13,),

                          Text("Delete",style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.w600),),
                          SizedBox(width: 13,),


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
