import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/providers/singleton.dart';
import 'package:phongtro/ui/screen/profile_screen/widgets/about_widget.dart';

import '../widgets/build_profile.dart';
import '../widgets/language_widget.dart';
import '../widgets/log_out_widget.dart';
import '../widgets/mypost_widget.dart';
import '../widgets/saved_widget.dart';
import '../widgets/settings_widget.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              BuildProfile(Singleton.instance.account),
              const SizedBox(
                height: 20,
              ),
              _buildOptions(context),
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
