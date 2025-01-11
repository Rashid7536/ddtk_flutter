//import 'adminPrev.dart';
import 'retrieveNoBG.dart';
import 'retrieveNoPRA.dart';
import 'retrieveNoRU.dart';
import 'retrieveNoStatus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class reveiewPage extends StatefulWidget {
  const reveiewPage({super.key});

  @override
  State<reveiewPage> createState() => _reveiewPageState();
}

class _reveiewPageState extends State<reveiewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Page"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => BGret()));
                },
                child: Text("Add Blood Group")),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => PRAret()));
                },
                child: Text("Add PRA%")),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => RUret()));
                },
                child: Text("Add RU")),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => STAret()));
                },
                child: Text("Status Update")),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Not Initialized Yet!');
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => adminPrev()));
                },
                child: Text("Admin Previlages")),
            Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }
}
