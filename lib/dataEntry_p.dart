import '../database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class dataEntry_p extends StatefulWidget {
  const dataEntry_p({super.key});

  @override
  State<dataEntry_p> createState() => _dataEntry_pState();
}

class _dataEntry_pState extends State<dataEntry_p> {
  final nameControl = TextEditingController();
  final idControl = TextEditingController();
  final dobControl = TextEditingController();
  final sexControl = TextEditingController();
  final eControl = TextEditingController();
  final telControl = TextEditingController();
  final provControl = TextEditingController();
  final cityControl = TextEditingController();
  final DateGet = DateTime.now();
  final data_class = Database_mthds();

  // void disposeTextB() {
  // nameControl.dispose();
  //  super.dispose();
  //}

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final emailRet = currentUser!.email;
    int YearNow = DateGet.year;
    return Scaffold(
        appBar: AppBar(
          title: Text('Self Registration'),
          backgroundColor: Colors.amber,
          //automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 300,
              //height: 500,
              child: Column(children: [
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "Name: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
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
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "National ID: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
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
                    keyboardType: TextInputType.datetime,
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
                Column(children: [
                  Text(
                    "Telephone No: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
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
                  Text(
                    emailRet.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                  // TextField(
                  //   keyboardType: TextInputType.emailAddress,
                  //   controller: eControl,
                  //   decoration: InputDecoration(
                  //       filled: true,
                  //       //fillColor: Colors.white,
                  //       //hintText: "Username",
                  //       labelText: "     Email",
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(50))),
                  // ),
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
                  Text(
                    "Sex: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
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
                  Padding(padding: EdgeInsets.all(15)),
                  ElevatedButton(
                      onPressed: () {
                        //TODO
                        // USE THIS AFTER CONFIRMING
                        //Navigator.of(context).pop();
                        if (nameControl.text == "" ||
                            idControl.text == "" ||
                            sexControl.text == "" ||
                            telControl.text == "" ||
                            //eControl.text == "" ||
                            cityControl.text == "" ||
                            provControl.text == "") {
                          Fluttertoast.showToast(
                              msg: "Fill All Fields",
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
                                      Text('Telephone.: ' + telControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Email: ' + emailRet.toString()),
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
                                            try {
                                              data_class.pushData(
                                                  nameControl.text,
                                                  idControl.text,
                                                  dobControl.text,
                                                  telControl.text,
                                                  emailRet.toString(),
                                                  cityControl.text,
                                                  provControl.text,
                                                  sexControl.text);
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Registration Succesful");
                                            } catch (e) {
                                              // TODO
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Registration Succesful: " +
                                                          e.toString());
                                            }
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
