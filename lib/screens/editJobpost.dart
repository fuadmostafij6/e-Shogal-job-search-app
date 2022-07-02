
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshogal/screens/creatjobScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class EditJobPost extends StatefulWidget {
  final String postId;
  final String job;
  final String title;
  final String details;
  final String area;
  final String deadlineDate;
  final String joiningDate;
  final String salary;
  final String count;
  final String lan;
  final String lon;

  const EditJobPost({Key? key, required this.postId, required this.job, required this.title, required this.details, required this.area, required this.deadlineDate, required this.joiningDate, required this.salary, required this.count, required this.lan, required this.lon,}) : super(key: key);

  @override
  State<EditJobPost> createState() => _EditJobPostState();
}

class _EditJobPostState extends State<EditJobPost> {

  final _formKey = GlobalKey<FormState>();
  List<String> items = ["Select Type of Employment", "Hourly", "Monthly"];
  List<String> areas = ["Job Area", "Riad"];
  String selectedJobType = "Select Type of Employment";
  String selectedArea = "Job Area";
  int counter = 1;
  final jobTitleController = TextEditingController();
  final jobTitleDetails = TextEditingController();
  final salaryController = TextEditingController();
  String deadLineController = "MM/DD/YYY";
  String joiningController = "MM/DD/YYY";
  CollectionReference jobPost = FirebaseFirestore.instance.collection('job_post');

  Future<void> editJobPost( String jobTitle, String jobDetails,String typeOfEmployment, String jobArea, String lan, String long, String deadline, String joining,String salary, String vacancy  ) {

    final uid = FirebaseAuth.instance.currentUser!.uid;
    final myJob =jobPost.doc(widget.postId);
    return myJob
        .update({
      'job_post_id': widget.postId,
      'uid': uid,
      'publish': true,
      'tile': jobTitle,
      'Details': jobDetails,
      'typeOfEmployment':typeOfEmployment,
      'jobArea':jobArea,
      'lan':lan,
      'long':long,
      'deadline': deadline,
      'joining': joining,
      'salary': salary,
      'vacancy': vacancy



    })
        .then((value) =>  Fluttertoast.showToast(
        msg: "Update Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0)
        .catchError((error) =>  Fluttertoast.showToast(
        msg: "Something Wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0)));
  }


  @override
  void initState() {
    setState(()=>{
    jobTitleController.text =widget.title,
      jobTitleDetails.text = widget.details,
      selectedJobType = widget.job,
      selectedArea = widget.area,
      salaryController.text = widget.salary,
      deadLineController = widget.deadlineDate,
      joiningController =widget.joiningDate,
      counter = int.parse(widget.count),

      print(widget.postId)


    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    DropdownMenuItem<String> Item(String item) =>
        DropdownMenuItem(value: item, child: Center(child: Text(item)));

    DropdownMenuItem<String> area(String item) =>
        DropdownMenuItem(value: item, child: Center(child: Text(item)));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Job"),
        backgroundColor: Colors.grey[800],
        elevation: 0,
      ),
      backgroundColor: Colors.blue.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15.0,
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
                                    border: Border.all(
                                        color: Colors.green, width: 4)),
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.list,
                                  size: 40,
                                  color: Colors.green[800],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Center(child: Text("All Users"))
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
                                    border: Border.all(
                                        color: Colors.green, width: 4)),
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.book,
                                  size: 40,
                                  color: Colors.green[800],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Center(child: Text("Users"))
                          ],
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const CreateJobScreen()));
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[200],
                                      border: Border.all(
                                          color: Colors.green, width: 4)),
                                  height: 60,
                                  width: 60,
                                  child: Icon(
                                    Icons.book,
                                    size: 40,
                                    color: Colors.green[800],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Center(child: Text("Job Post"))
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
                                    border: Border.all(
                                        color: Colors.green, width: 4)),
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.settings,
                                  size: 40,
                                  color: Colors.green[800],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Center(child: Text("Settings"))
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    "Post Your Job Details Here",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextFormField(
                    controller: jobTitleController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    // controller: phoneController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "your Job title is empty";
                      }
                      return null;
                    },
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      filled: true,
                      alignLabelWithHint: false,
                      //add prefix icon
                      // suffixIcon: IconButton(
                      //   icon: const Icon(
                      //     Icons.close,
                      //     color: Colors.grey,
                      //   ),
                      //   onPressed: () {
                      //     setState(() => {
                      //       FocusScope.of(context).unfocus(),
                      //       // phoneController.text = ""
                      //     });
                      //   },
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.white,

                      hintText: "Wright Your Job position Here",

                      //make hint text
                      hintStyle: TextStyle(
                        color: Colors.green[900],
                        fontSize: 22,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.bold,
                      ),

                      labelText: 'Job Title',

                      labelStyle: TextStyle(
                        color: Colors.green[900],
                        fontSize: 20,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextFormField(
                    controller: jobTitleDetails,
                    maxLines: 8,
                    minLines: 7,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    // controller: phoneController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "your Job Details is empty";
                      }
                      return null;
                    },
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      alignLabelWithHint: false,
                      focusColor: Colors.white,
                      filled: true,

                      //add prefix icon
                      // suffixIcon: IconButton(
                      //   icon: const Icon(
                      //     Icons.close,
                      //     color: Colors.grey,
                      //   ),
                      //   onPressed: () {
                      //     setState(() => {
                      //       FocusScope.of(context).unfocus(),
                      //       // phoneController.text = ""
                      //     });
                      //   },
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.white,

                      hintText: "Wright Your Job Details Here",

                      //make hint text
                      hintStyle: TextStyle(
                        color: Colors.green[900],
                        fontSize: 22,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.bold,
                      ),

                      labelText: 'Job Details',

                      labelStyle: TextStyle(
                        color: Colors.green[900],
                        fontSize: 20,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .5,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedJobType,
                          isExpanded: true,
                          items: items.map(Item).toList(),
                          onChanged: (value) {
                            setState(() => {selectedJobType = value!});
                          },
                          iconSize: 36,
                          icon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                selectedJobType != "Hourly"
                    ? Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .5,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedArea,
                          isExpanded: true,
                          items: areas.map(area).toList(),
                          onChanged: (value) {
                            setState(() => {selectedArea = value!});
                          },
                          iconSize: 36,
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ),
                )
                    : const SizedBox(),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: TextFormField(
                          controller: salaryController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          // controller: phoneController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "your Salary is empty";
                            }
                            return null;
                          },
                          enableSuggestions: true,
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            filled: true,
                            alignLabelWithHint: false,
                            //add prefix icon
                            // suffixIcon: IconButton(
                            //   icon: const Icon(
                            //     Icons.close,
                            //     color: Colors.grey,
                            //   ),
                            //   onPressed: () {
                            //     setState(() => {
                            //       FocusScope.of(context).unfocus(),
                            //       // phoneController.text = ""
                            //     });
                            //   },
                            // ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: Colors.white,

                            hintText: "Wright Your Job position Here",

                            //make hint text
                            hintStyle: TextStyle(
                              color: Colors.green[900],
                              fontSize: 22,
                              fontFamily: "verdana_regular",
                              fontWeight: FontWeight.bold,
                            ),

                            labelText: 'Salary',

                            labelStyle: TextStyle(
                              color: Colors.green[900],
                              fontSize: 20,
                              fontFamily: "verdana_regular",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green.shade500,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 22.0),
                          ),
                          onPressed: () {},
                          child: selectedJobType != "Hourly"
                              ? const Text(
                            "Riyal/Month",
                            style: TextStyle(color: Colors.white),
                          )
                              : const Text(
                            "Riyal/Hour",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Deadline",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.64,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green.shade500,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 22.0),
                            ),
                            onPressed: () async{
                              DateTime? newDeadline = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2050));

                              if(newDeadline==null) return;
                              setState(()=>{
                                deadLineController = "${newDeadline.day}-${newDeadline.month}-${newDeadline.year}"
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:  [
                                const Icon(
                                  Icons.date_range,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Text(
                                  deadLineController,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Joining",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.64,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green.shade500,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 22.0),
                            ),
                            onPressed: () async{
                              DateTime? newJoining = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2050));

                              if(newJoining==null) return;
                              setState(()=>{
                                joiningController = "${newJoining.day}-${newJoining.month}-${newJoining.year}"
                              });

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:  [
                                const Icon(
                                  Icons.date_range,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Text(
                                  joiningController,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() => {counter++});
                          },
                          icon: const Icon(Icons.add),
                        ),
                        Text(
                          counter.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() => {
                              if (counter < 2) {} else {counter--}
                            });
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.green.shade900,   padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),),

                      onPressed: ()async{
                        if(_formKey.currentState!.validate()) {
                          editJobPost(jobTitleController.text,jobTitleDetails.text, selectedJobType,selectedArea,widget.lan,widget.lon, deadLineController,joiningController,salaryController.text.toString(), counter.toString());

                          }

                      }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add, color: Colors.white,),
                      Text("Update job", style: TextStyle(color: Colors.white),)
                    ],
                  )),
                ),
                const SizedBox(height: 20.0,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
