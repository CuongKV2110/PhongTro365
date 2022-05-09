import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostedScreen extends StatefulWidget {
  @override
  _PostedScreenState createState() => _PostedScreenState();
}

class _PostedScreenState extends State<PostedScreen> {
  dynamic data;

  Future<dynamic> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("test").doc('uid');

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(data.toString()),
                Text(data['email']),
                Text(data['password']),
              ])),
    );
  }
}
