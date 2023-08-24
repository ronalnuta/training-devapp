import 'package:flutter/material.dart';
import 'package:my_app/src/features/profile/widgets/body_profile.dart';
import 'package:my_app/src/features/profile/widgets/header_profile.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(children: [GapHelper.h120, const BodyProfile()]),
        const HeaderProfile(),
      ]),
      backgroundColor: XColors.bgScreen,
    );
  }
}
