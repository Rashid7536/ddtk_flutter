import 'dart:ui';
import '../database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class addPatient extends StatefulWidget {
  const addPatient({super.key});

  @override
  State<addPatient> createState() => _addPatientState();
}

class _addPatientState extends State<addPatient> {
  final nameControl = TextEditingController();
  final idControl = TextEditingController();
  final bgControl = TextEditingController();
  final praControl = TextEditingController();
  final dobControl = TextEditingController();
  final DdateControl = TextEditingController();
  final ruControl = TextEditingController();
  final statusControl = TextEditingController();
  final sexControl = TextEditingController();
  final eControl = TextEditingController();
  final telControl = TextEditingController();
  final provControl = TextEditingController();
  final cityControl = TextEditingController();
  final spConsider = TextEditingController();
  final DateGet = DateTime.now();
  final data_class = Database_mthds();

  // void disposeTextB() {
  // nameControl.dispose();
  //  super.dispose();
  //}

  @override
  Widget build(BuildContext context) {
    int YearNow = DateGet.year;
    return Scaffold(
        appBar: AppBar(title: Text('Add Patient Data')),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 300,
              //height: 500,
              child: Column(children: [
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Name: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Text.rich(
                        TextSpan(
                            text: '*',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontFeatures: [FontFeature.superscripts()])),
                      ),
                    ],
                  ),
                  TextField(
                    maxLength: 24,
                    controller: nameControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(1)),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "National ID: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Text.rich(
                        TextSpan(
                            text: '*',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontFeatures: [FontFeature.superscripts()])),
                      ),
                    ],
                  ),
                  TextField(
                    controller: idControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     National ID",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "Date of Birth: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    //errorInvalidText: "Invalid Date",
                    onTap: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(YearNow + 10),
                        initialDate: DateTime.now(),
                      ).then((date) {
                        setState(() {
                          String FormatDate =
                              DateFormat("d" + "/" + "M" + "/" + "y")
                                  .format(date!);
                          dobControl.text = FormatDate;
                        });
                      });
                    },
                    keyboardType: TextInputType.none,
                    controller: dobControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Date of Birth",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  " Add Blood Group ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                //Padding(padding: EdgeInsets.all(5)),
                DropdownMenu(
                  //keyboardType,
                  controller: bgControl,
                  dropdownMenuEntries: <DropdownMenuEntry>[
                    DropdownMenuEntry(value: "1", label: "A"),
                    DropdownMenuEntry(value: "2", label: "B"),
                    DropdownMenuEntry(value: "3", label: "AB"),
                    DropdownMenuEntry(value: "4", label: "O")
                  ],
                  requestFocusOnTap: false,

                  onSelected: (value) {
                    setState(() {
                      if (value == "1") {
                        bgControl.text = "A";
                      } else if (value == "2") {
                        bgControl.text = "B";
                      } else if (value == "3") {
                        bgControl.text = "AB";
                      } else if (value == "4") {
                        bgControl.text = "O";
                      }
                    });
                  },
                  label: Text("    Select Blood Group"),
                  width: 300,
                  inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),

                Padding(padding: EdgeInsets.all(10)),
                //Padding(padding: EdgeInsets.all(15)),
                Text(" Add PRA% ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue)),
                //Padding(padding: EdgeInsets.all(5)),

                Container(
                  width: 350,
                  child: TextField(
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    controller: praControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Add PRA%",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(" Add RU ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue)),
                //Padding(padding: EdgeInsets.all(5)),

                Container(
                  width: 350,
                  child: TextField(
                    //maxLength: 3,
                    keyboardType: TextInputType.number,
                    controller: ruControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Add RU",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "Dialysis Date: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    //errorInvalidText: "Invalid Date",
                    onTap: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(YearNow + 10),
                        initialDate: DateTime.now(),
                      ).then((date) {
                        setState(() {
                          String FormatDate =
                              DateFormat("d" + "/" + "M" + "/" + "y")
                                  .format(date!);
                          DdateControl.text = FormatDate;
                        });
                      });
                    },
                    keyboardType: TextInputType.none,
                    controller: DdateControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Dialysis Date",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Select Status: ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text.rich(
                      TextSpan(
                          text: '*',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontFeatures: [FontFeature.superscripts()])),
                    ),
                  ],
                ),
                //Padding(padding: EdgeInsets.all(5)),
                DropdownMenu(
                  //keyboardType,
                  controller: statusControl,
                  dropdownMenuEntries: <DropdownMenuEntry>[
                    DropdownMenuEntry(value: "1", label: "Active"),
                    DropdownMenuEntry(value: "2", label: "Inactive"),
                    DropdownMenuEntry(value: "3", label: "Pending"),
                    //DropdownMenuEntry(value: "4", label: "O")
                  ],
                  requestFocusOnTap: false,

                  onSelected: (value) {
                    setState(() {
                      if (value == "1") {
                        statusControl.text = "Active";
                      } else if (value == "2") {
                        statusControl.text = "Inactive";
                      } else if (value == "3") {
                        statusControl.text = "Pending";
                      }
                      // else if (value == "4") {
                      //   bgControl.text = "O";
                      // }
                    });
                  },
                  label: Text("    Select Status"),
                  width: 300,
                  inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Telephone No: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Text.rich(
                        TextSpan(
                            text: '*',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontFeatures: [FontFeature.superscripts()])),
                      ),
                    ],
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    controller: telControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Telephone No",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(8)),
                Column(children: [
                  Text(
                    "Email: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: eControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "City: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    controller: cityControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     City",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "Province: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    controller: provControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Province",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sex: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Text.rich(
                        TextSpan(
                            text: '*',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontFeatures: [FontFeature.superscripts()])),
                      ),
                    ],
                  ),
                  DropdownMenu(
                    dropdownMenuEntries: <DropdownMenuEntry>[
                      DropdownMenuEntry(value: "1", label: "Male"),
                      DropdownMenuEntry(value: "2", label: "Female")
                    ],
                    onSelected: (value) {
                      if (value == "1") {
                        sexControl.text = "Male";
                      } else {
                        sexControl.text = "Female";
                      }
                    },
                    label: Text("    Select Gender"),
                    width: 300,
                    inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Column(children: [
                    Text(
                      "Special Considerations: ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    TextField(
                      controller: spConsider,
                      decoration: InputDecoration(
                          filled: true,
                          //fillColor: Colors.white,
                          //hintText: "Username",
                          labelText: "     Special Considerations",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                  ]),
                  ElevatedButton(
                      onPressed: () {
                        //TODO
                        // USE THIS AFTER CONFIRMING
                        //Navigator.of(context).pop();
                        if (nameControl.text == "" ||
                            idControl.text == "" ||
                            sexControl.text == "" ||
                            telControl.text == "" ||
                            statusControl.text == "") {
                          Fluttertoast.showToast(
                              msg: "Fill All Fields",
                              gravity: ToastGravity.CENTER);
                        } else if (eControl.text == "" ||
                            !eControl.text.contains('@') ||
                            !eControl.text.contains(".")) {
                          Fluttertoast.showToast(
                              msg: "INVALID EMAIL TYPE",
                              gravity: ToastGravity.CENTER);
                        } else {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Data Confirmation'),
                                  content: SingleChildScrollView(
                                    child: ListBody(children: [
                                      Text('Name: ' + nameControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('IDNo.: ' + idControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Date of Birth: ' + dobControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Blood Group: ' + bgControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('PRA%: ' + praControl.text + " %"),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('RU: ' + ruControl.text + " %"),
                                      Padding(padding: EdgeInsets.all(8)),
                                      Text('Dialysis Date: ' +
                                          DdateControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Status: ' + statusControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Telephone.: ' + telControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Email: ' + eControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('City: ' + cityControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Province: ' + provControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Sex: ' + sexControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      ElevatedButton(
                                          onPressed: () {
                                            //add the function firebase.push()
                                            data_class.pushDataAdd(
                                                nameControl.text,
                                                idControl.text,
                                                dobControl.text,
                                                bgControl.text,
                                                praControl.text,
                                                statusControl.text,
                                                telControl.text,
                                                eControl.text,
                                                cityControl.text,
                                                provControl.text,
                                                sexControl.text,
                                                DdateControl.text,
                                                ruControl.text,
                                                spConsider.text);
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Confirm')),
                                      Padding(padding: EdgeInsets.all(10)),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cancel'))
                                    ]),
                                  ),
                                );
                              });
                        }
                      },
                      child: Text("Submit Data")),
                  Padding(padding: EdgeInsets.all(30)),
                  //ElevatedButton(onPressed: () {}, child: Text("Sign Up"))
                ]),
              ]),
            ),
          ),
        ));
  }
}
