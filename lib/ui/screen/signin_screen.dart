import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/generated/l10n.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //_buildIconApp(),
            _buildLoginForn(),
          ],
        ),
      ),
    );
  }

  Widget _buildIconApp() {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Image.network(
              'https://ancona.esn.it/sites/esnancona.it/files/styles/zoom/public/pages/images/house%20search.jpg?itok=UumP9zrE'),
        ),
        Text(S.of(context).appname)
      ],
    );
  }

  Widget _buildLoginForn() {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(2),
              child: TextField(
                //controller: userController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  hintText: S.of(context).username,
                  // errorText: snapshot.hasError ? snapshot.error.toString() : null,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: TextField(
                obscureText: true,
                //controller: passController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key_outlined),
                  hintText: S.of(context).password,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              child: Text(
                S.of(context).login.toUpperCase(),
                style: TextStyle(fontSize: 14),
              ),
              style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            /*Container(
              height: 44.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                gradient: LinearGradient(
                  colors: [Colors.lightGreenAccent, Colors.greenAccent],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: Text('Elevated Button'),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
