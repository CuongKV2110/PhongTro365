import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/generated/l10n.dart';
import 'package:phongtro/ui/screen/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.network(
                  'https://ancona.esn.it/sites/esnancona.it/files/styles/zoom/public/pages/images/house%20search.jpg?itok=UumP9zrE'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).appname,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              S.of(context).splash1,
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SigninScreen();
                      },
                    ),
                  );
                },
                child: Text(S.of(context).login),
            )
          ],
        ),
      ),
    );
  }
}
