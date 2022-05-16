import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';

class ContentWidget extends StatefulWidget {
  TextEditingController contentController;

  ContentWidget(this.contentController);

  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nội dung',
          style: TextStyle(
              fontSize: 18,
              color: AppColors.black,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget.contentController,
          textAlign: TextAlign.start,
          maxLines: null,
          decoration: const InputDecoration(
              hintText: 'Viết bài',
              hintStyle: TextStyle(color: AppColors.gray)),
        ),
      ],
    );
  }
}
