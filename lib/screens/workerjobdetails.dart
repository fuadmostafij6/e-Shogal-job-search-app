import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshogal/login/loginwithemail.dart';
import 'package:eshogal/screens/profile_screen.dart';
import 'package:eshogal/screens/worker_dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WorkerJobDetails extends StatefulWidget {
  final String jobTitle;
  final String jobDetails;
  final String location;
  final String vacancy;
  final String salary;
  final String jobId;
  final String postedBy;
  final double lat;
  final double long;
  const WorkerJobDetails({Key? key, required this.jobTitle, required this.jobDetails, required this.location, required this.vacancy, required this.salary, required this.postedBy, required this.jobId, required this.lat, required this.long}) : super(key: key);

  @override
  State<WorkerJobDetails> createState() => _WorkerJobDetailsState();
}

class _WorkerJobDetailsState extends State<WorkerJobDetails> {
  int field = 0;
  List userDataList = [];
  String? phone;
  String? name;
  BitmapDescriptor ? customIcon;


  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginWithEmail())));
  }
 void createCustomIcon(){
    if(customIcon==null){
      //ImageConfiguration imageConfiguration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/images/ll.png").then((value) {
        setState((){
          customIcon= value;
        });
      });

    }
  }

  // Future<Uint8List> _getBytesFromAsset(String path, int width){
  //  
  //
  // }
  final uid = FirebaseAuth.instance.currentUser!.uid;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  fetchWorkerData() async {
    QuerySnapshot qn = await FirebaseFirestore.instance.collection("users")
        .get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        if (qn.docs[i]["uid"] == uid) {
          setState(() =>
          {
            userDataList.add({
              "name": qn.docs[i]["name"],
              "phone": qn.docs[i]["phone"],
              "uid": qn.docs[i]["uid"],
            })
          });
        }
      }
    });


    return qn.docs;
  }

  CollectionReference apply = FirebaseFirestore.instance.collection('apply');

  applyNow() {
    final myApply = apply.doc();

    return myApply.set({
      'job_post_id': widget.jobId,
      'uid': uid,
      'worker_phone': phone,
      'worker_name': name,


    }).then((value) {
       Fluttertoast.showToast(
            msg: "Apply Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      Get.offAll(WorkerDashboardScreen());

    },

    );

  }

  findUserData() {
    setState(() =>
    {
      name = userDataList[0]["name"],
      phone = userDataList[0]["phone"]
    });
  }

  addMarker(id,LatLng latLong, {icon , title}) {
    // creating a new MARKER
    final MarkerId markerId = MarkerId(id);
    final Marker marker = Marker(
      markerId: markerId,
      //icon: customIcon!,
      infoWindow: InfoWindow(title: title.toString()),
      //icon: icon,
      position: latLong,
    );
    markers[markerId] = marker;
    _controller.future.then((value) {
     var currentPosition = CameraPosition(
        target: latLong,
        bearing: 90,
        tilt: 45,
        zoom: 19,
      );
      value.animateCamera(CameraUpdate.newCameraPosition(currentPosition));
    });
    setState((){});

  }

  addWorkerMarker()async{

    LocationPermission parmission= await Geolocator.checkPermission();

    //await Geolocator.requestPermission();
    print("parmission");
    print(parmission);

    Geolocator.getCurrentPosition().then((value) {


      addMarker(
        "markerId2",LatLng(value.latitude, value.longitude) ,title: "worker",icon: customIcon);

      markers.entries.forEach((element) {
        print(element);
      });

    });



  }


  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};


  @override
  void initState() {
    super.initState();
    createCustomIcon();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

      await Geolocator.requestPermission();
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar('', 'Location Permission Denied');

          /* return Future.error('Location permissions are denied');*/
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        /*return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');*/
      }


    });
  }

  void checkPermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
     //   openAppSettings();
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        checkPermission();
      }
    } else if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // openAppSettings();
      checkPermission();
    } else if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      // _getUserLocation();
    }
  }


  @override
  Widget build(BuildContext context) {
    print(userDataList);
    var stream = FirebaseFirestore.instance.collection("apply").snapshots();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Job Details"),

        backgroundColor: Colors.grey[800],
      ),
      body: Column(
        // shrinkWrap: true,
        // primary: false,
        children: [
          SizedBox(height: 20.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 50.0,),
              Column(
                children: [

                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => WorkerDashboardScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.green, width: 4)
                        ),
                        height: 60,
                        width: 60,
                        child: Icon(Icons.date_range, size: 40, color: Colors
                            .green[800],),

                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Center(child: Text("Monthly"))
                ],
              ),

              SizedBox(width: 50,),
              // Expanded(
              //   child: Column(
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           setState(() =>
              //           {
              //             field = 1
              //           });
              //         },
              //         child: Padding(
              //           padding: const EdgeInsets.all(0.0),
              //           child: Container(
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10),
              //                 color: Colors.grey[200],
              //                 border: Border.all(color: Colors.green, width: 4)
              //             ),
              //             height: 60,
              //             width: 60,
              //             child: Icon(Icons.pin_drop, size: 40, color: Colors
              //                 .green[800],),
              //
              //           ),
              //         ),
              //       ),
              //       SizedBox(height: 5,),
              //       Center(child: Text("Near Me"))
              //     ],
              //   ),
              // ),
              InkWell(
                onTap: () {
                 Get.to(Profile());
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.green, width: 4)
                        ),
                        height: 60,
                        width: 60,
                        child: Icon(Icons.person, size: 40, color: Colors
                            .green[800],),

                      ),
                    ),
                    SizedBox(height: 5,),
                    Center(child: Text("Profile"))
                  ],
                ),
              ),

              SizedBox(width: 50,),
              InkWell(
                onTap: () {
                  _signOut();
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                            border:
                            Border.all(color: Colors.green, width: 4)),
                        height: 60,
                        width: 60,
                        child: Icon(
                          Icons.logout,
                          size: 40,
                          color: Colors.green[800],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(child: Text("LogOut"))
                  ],
                ),
              ),
              SizedBox(width: 50,),


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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: [
                            const Text(
                              "Location :",
                              style: TextStyle(
                                  fontSize:
                                  16,
                                  color: Colors
                                      .black,
                                  fontWeight:
                                  FontWeight
                                      .bold),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              "${widget.location}",
                              style:  TextStyle(
                                  fontSize:
                                  16,
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
                              8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.end,
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .end,
                            children: [
                              const Text(
                                "Salary :",
                                style: TextStyle(
                                    fontSize:
                                    16,
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
                                    16,
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
                    Row(
                      children: [
                        Text("Job Details :", style: TextStyle(
                            fontSize: 16,
                            color: Colors
                                .black,
                            fontWeight:
                            FontWeight
                                .bold),),
                        SizedBox(width: 20,),
                        Text(widget.jobDetails, style: TextStyle(
                            fontSize: 16,
                            color: Colors
                                .black,
                            fontWeight:
                            FontWeight
                                .w400),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Row(
                        children: [
                          Text(
                            "Posted By :",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors
                                    .black,
                                fontWeight:
                                FontWeight
                                    .bold),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            widget.postedBy,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors
                                    .black,
                                fontWeight:
                                FontWeight
                                    .w400),
                          ),
                          Spacer(),
                          Text("Vacancy :", style: TextStyle(
                              fontSize: 14,
                              color: Colors
                                  .black,
                              fontWeight:
                              FontWeight
                                  .bold),),
                          SizedBox(width: 10,),

                          Text(widget.vacancy,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors
                                      .black,
                                  fontWeight:
                                  FontWeight
                                      .w400))
                        ],
                      ),
                    ),

                    SizedBox(height: 20.0,),

                  ],
                ),
              ),
            ),
          ),
         // SizedBox(height: 10.0,),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoogleMap(
                markers: Set<Marker>.of(markers.values),


                // mapType: MapType.,
                initialCameraPosition: _kGooglePlex,


                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  addMarker(
                    "markerId", LatLng(widget.lat,
                      widget.long),title: "Job Location");

                  addWorkerMarker();
                },
              ),
            ),
          ),

          Container(
            height: 40,
            width: 200,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextButton(

                style: TextButton.styleFrom(
                  // padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                    backgroundColor: Colors.green.shade900
                ),
                onPressed: () {

                  Get.defaultDialog(
                    buttonColor: Colors.green,
                    title: "Apply for the job?",
                    content: Container(),
                    onConfirm: (){
                      setState((){
                        applyNow();
                      });
                    },
                    cancelTextColor: Colors.red,
                    confirmTextColor: Colors.white,
                    onCancel: (){
                    },
                  );
                  // applyNow();
                },

                child: Text("Apply Now", style: TextStyle(color: Colors.white),)),

          ),

          SizedBox(height: 20,),
        ],),
    );
  }

}