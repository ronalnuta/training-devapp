import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/home/cubit/home_bloc.dart';
import 'package:my_app/src/features/home/widgets/body_home.dart';
import 'package:my_app/src/features/home/widgets/header_home.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(children: [
            GapHelper.h20,
            const HeaderHome(),
            GapHelper.h20,
            const BodyHome(),
          ]),
        ),
        backgroundColor: XColors.bgScreen,
      ),
    );
  }
}
