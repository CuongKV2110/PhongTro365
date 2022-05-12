import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/ui/screen/profile_screen/widgets/about_widget.dart';
import 'package:phongtro/ui/screen/profile_screen/widgets/log_out_widget.dart';
import 'package:phongtro/ui/screen/profile_screen/widgets/saved_widget.dart';
import 'package:phongtro/ui/screen/profile_screen/widgets/settings_widget.dart';
import '../../../../resources/colors.dart';
import '../../saved_screen/pages/saved_screen.dart';
import '../../sign_in_screen/pages/sign_in_screen.dart';
import '../widgets/build_profile.dart';
import '../widgets/language_widget.dart';
import '../widgets/mypost_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              BuildProfile(),
              const SizedBox(
                height: 20,
              ),
              _buildOptions(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptions(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyPostWidget(),
            SavedWidget(),
            SettingsWidget(),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LanguageWidget(),
            LogOutWidget(),
            AboutWidget(),
          ],
        ),
      ],
    );
  }
}
