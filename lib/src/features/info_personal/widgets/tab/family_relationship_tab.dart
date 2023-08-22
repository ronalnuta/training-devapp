import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/features/info_personal/cubit/info_family_bloc.dart';
import 'package:my_app/src/features/info_personal/widgets/tab/base_info_tab.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';

class FamilyRelationshipTab extends StatelessWidget {
  const FamilyRelationshipTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoFamilyBloc, InfoFamilyState>(
      builder: (_, state) {
        return state.family != null
            ? state.family!.tabOf
            : BaseInfoTab(wrapWithListView: false, children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                      width: 1,
                    ),
                    borderRadius: BorderHelper.r20,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  width: 353.w,
                  height: 151.h,
                  margin: EdgeInsets.only(top: 30.h),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Tile(family: FamilyInclude.father),
                      _Tile(family: FamilyInclude.mother),
                    ],
                  ),
                ),
                GapHelper.h20,
                Center(child: Image.asset(XImage.bannerInfo)),
              ]);
      },
      buildWhen: (p, c) => p.family != c.family,
    );
  }
}

class _Tile extends StatelessWidget {
  final FamilyInclude family;
  const _Tile({required this.family});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoFamilyBloc, InfoFamilyState>(
      builder: (context, _) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => context.read<InfoFamilyBloc>().onTap(family),
            splashColor: XColors.primary.withOpacity(0.1),
            child: ListTile(
              leading: Image.asset(XImage.icInfoFamily),
              title: Text(
                family.infoOf,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                      fontSize: 19,
                      letterSpacing: -0.41,
                    ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        );
      },
      buildWhen: (p, c) => false,
    );
  }
}
