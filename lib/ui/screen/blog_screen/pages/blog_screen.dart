import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://bandon.vn/blog',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
