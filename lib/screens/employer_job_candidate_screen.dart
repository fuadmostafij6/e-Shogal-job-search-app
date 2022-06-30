
import 'package:eshogal/screens/user_admin_screen.dart';
import 'package:flutter/material.dart';

class EmployerJobCandidateScreen extends StatefulWidget {
  const EmployerJobCandidateScreen({Key? key}) : super(key: key);

  @override
  State<EmployerJobCandidateScreen> createState() => _EmployerJobCandidateScreenState();
}

class _EmployerJobCandidateScreenState extends State<EmployerJobCandidateScreen> {
  @override
  Widget build(BuildContext context) {
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
          const Text("Flutter Developer",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),

          Expanded(child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 5,
            itemBuilder: (_,context){
              return GestureDetector(
                onTap: (){
                  Navigator.push(_, MaterialPageRoute(builder:(_)=> const UserAdminScreen() ));
                },
                child: Padding(
                  padding:  const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                    //    color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Abir Hasan",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                          SizedBox(height: 10,),
                          // Row(
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Text("Location :",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                          //         SizedBox(width: 10,),
                          //         Text("Badda Link Road ",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),)
                          //       ],
                          //     ),
                          //     Spacer(),
                          //     Padding(
                          //       padding: const EdgeInsets.only(right: 28.0),
                          //       child: Row(
                          //         children: [
                          //           Text("Salary :",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                          //           SizedBox(width: 10,),
                          //           Text("40000 ",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),)
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 10,),
                          //
                          // Row(
                          //   children: [
                          //     Text("Posted By :",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                          //     SizedBox(width: 10,),
                          //     Text("Abir hasan",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),)
                          //   ],
                          // ),
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
