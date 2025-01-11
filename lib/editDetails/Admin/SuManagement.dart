import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class suData extends StatefulWidget {
  const suData({super.key});

  @override
  State<suData> createState() => _suDataState();
}

class _suDataState extends State<suData> {
  Query FQuery = FirebaseDatabase.instance.ref().child('superuser');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Super Users'), backgroundColor: Colors.amber),
      body: Center(
          // child: FirebaseAnimatedList(
          //   query: FQuery,
          //   itemBuilder: (context, snapshot, animation, index) {
          //     Map users = snapshot.value as Map;
          //     users.forEach((key, value) {})
          //   },
          // ),
          ),
    );
  }
}
