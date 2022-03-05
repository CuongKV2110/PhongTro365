import 'package:flutter/material.dart';

class ShareRoomScreen extends StatefulWidget {
  const ShareRoomScreen({Key? key}) : super(key: key);

  @override
  _ShareRoomScreenState createState() => _ShareRoomScreenState();
}

class _ShareRoomScreenState extends State<ShareRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text('B'),
      ),
    );
  }
}
