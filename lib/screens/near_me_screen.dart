
import 'package:eshogal/screens/employer_dashboard_screen.dart';
import 'package:flutter/material.dart';

class NearMeScreen extends StatefulWidget {
  const NearMeScreen({Key? key}) : super(key: key);

  @override
  State<NearMeScreen> createState() => _NearMeScreenState();
}

class _NearMeScreenState extends State<NearMeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Near Me"),
        backgroundColor: Colors.grey[800],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
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
                            border: Border.all(color: Colors.green, width: 4)),
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
                            border: Border.all(color: Colors.green, width: 4)),
                        height: 60,
                        width: 60,
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 40,
                          color: Colors.green[800],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
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
                            border: Border.all(color: Colors.green, width: 4)),
                        height: 60,
                        width: 60,
                        child: Icon(
                          Icons.person_outline,
                          size: 40,
                          color: Colors.green[800],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(child: Text("My Profile"))
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Center(
            child: Text(
              "Live Jobs Around Me",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> EmployerDashBoardScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 38.0, right: 30),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 40,
                width: double.infinity,
                child: Text(
                  "Select Location",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
