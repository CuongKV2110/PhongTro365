import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
import 'package:phongtro/ui/screen/home_screen/pages/home_screen.dart';
import 'package:phongtro/ui/screen/write_screen/bloc/write_bloc/write_state.dart';
import '../../../../helpers/ui_helper.dart';
import '../bloc/write_bloc/write_bloc.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({Key? key}) : super(key: key);

  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  TextEditingController contentController = TextEditingController();
  WriteBloc bloc = WriteBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Viết bài',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: AppColors.black,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: BlocListener(
              bloc: bloc,
              listener: (context, state) {
                if (state is WriteLoading) {
                  UiHelper.showLoading(context);
                }
                if (state is WriteLoaded) {
                  UiHelper.hideLoading(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomeScreen();
                      },
                    ),
                  );
                }
                if (state is WriteError) {
                  UiHelper.hideLoading(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(''),
                  ));
                }
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
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
                            controller: contentController,
                            textAlign: TextAlign.start,
                            maxLines: null,
                            decoration: const InputDecoration(
                              hintText: 'Viết bài',
                              hintStyle: TextStyle(color: AppColors.gray),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            bloc.writePost(contentController.text.trim());
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.orange1,
                                  AppColors.orange2,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Container(
                              width: AppDimensions.d40w,
                              height: 40,
                              alignment: Alignment.center,
                              child: const Text(
                                'Đăng bài',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
