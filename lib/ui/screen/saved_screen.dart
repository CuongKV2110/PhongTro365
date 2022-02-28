import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: const [
            Text('Hello'),
            Text('KVC'),
            Text('Goodnight'),
          ],
        )
    );
  }
}
