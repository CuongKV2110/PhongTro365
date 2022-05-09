import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc("CWXqV2kRTiFBZMhVsWz8").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data?.data();
          print(data);

          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data?.get('displayName')),
                    Text(snapshot.data?.get('email')),
                    Text(snapshot.data?.get('location')),
                    Text(snapshot.data?.get('phoneNumber')),
                  ],
                ),
              ),
            ),
          );
        }

        return const Text("loading");
      },
    );
  }
}
