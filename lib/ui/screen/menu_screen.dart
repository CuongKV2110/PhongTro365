import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/generated/l10n.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/bgr.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Kieu Van Cuong')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: AppDimensions.d50w,
                    mainAxisExtent: 70,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 10,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(index.toString()),
                    decoration: BoxDecoration(
                        color: AppColors.colorItem1,
                        borderRadius: BorderRadius.circular(15)),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: AppDimensions.d90w,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).setting,
                    style: const TextStyle(color: AppColors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.all(10)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: AppDimensions.d90w,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).support,
                    style: const TextStyle(color: AppColors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.all(10)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: AppDimensions.d90w,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).logout,
                    style: const TextStyle(color: AppColors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.all(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
