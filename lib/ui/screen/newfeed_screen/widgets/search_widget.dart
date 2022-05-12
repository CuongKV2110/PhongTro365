import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../resources/colors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
          padding: EdgeInsets.fromLTRB(19, 0, 29, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: TextField(
                  style: TextStyle(color: AppColors.black),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.black),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.black),
                    ),
                    hintText: 'Tìm phòng',
                    hintStyle: TextStyle(
                      color: AppColors.black50,
                      fontSize: 15,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.black50,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(Ionicons.options_outline,
                    color: AppColors.orange1),
              )
            ],
          )),
    );
  }
}
