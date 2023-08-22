import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/info_personal/cubit/info_family_bloc.dart';
import 'package:my_app/src/features/info_personal/cubit/info_personal_bloc.dart';
import 'package:my_app/src/features/info_personal/cubit/info_student_bloc.dart';
import 'package:my_app/src/features/info_personal/widgets/tab/info_personal.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/widgets/common/indicator.dart';

class InfoStudentPage extends StatelessWidget {
  const InfoStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => InfoStudentBloc(),
        ),
        BlocProvider(
          create: (_) => InfoFamilyBloc(),
        ),
        BlocProvider(
          create: (_) => InfoPersonalBloc(),
        ),
      ],
      child: BlocBuilder<InfoPersonalBloc, InfoPersonalState>(
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Thông tin cá nhân",
                textAlign: TextAlign.center,
              ),
            ),
            body: state.isLoading
                ? const XIndicator()
                : Column(children: [GapHelper.h20, const InfoPersonal()]),
            backgroundColor: Colors.white,
          );
        },
        buildWhen: (p, c) => p.isLoading != c.isLoading,
      ),
    );
  }
}
