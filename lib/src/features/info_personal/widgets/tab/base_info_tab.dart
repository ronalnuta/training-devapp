import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/features/info_personal/cubit/info_family_bloc.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/radius.dart';
import 'package:my_app/widgets/common/empty_widget.dart';

class BaseInfoTab extends StatelessWidget {
  final List<Widget> children;
  final bool wrapWithListView;
  const BaseInfoTab({
    super.key,
    required this.children,
    this.wrapWithListView = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        width: ScreenUtil().screenWidth,
        child: wrapWithListView
            ? ListView(
                physics: const ClampingScrollPhysics(),
                children: [_Body(children: children)],
              )
            : Stack(children: [
                Column(children: [_Body(children: children)]),
                Positioned(bottom: 0, child: Image.asset(XImage.layerBotInfo)),
              ]),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final List<Widget> children;
  const _Body({required this.children});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              XImage.layerTopInfo,
              width: ScreenUtil().screenWidth,
              fit: BoxFit.cover,
            ),
          ),
        ),
        BlocBuilder<InfoFamilyBloc, InfoFamilyState>(
          builder: (context, state) {
            return state.family == null
                ? const EmptyWidget()
                : Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 10.h),
                      child: ElevatedButton(
                        onPressed: () =>
                            context.read<InfoFamilyBloc>().onTap(null),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(30.w, 30.w),
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: XColors.primary,
                        ),
                      ),
                    ),
                  );
          },
          buildWhen: (p, c) => p.family != c.family,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: XColors.primary, width: 1),
              borderRadius: BorderHelper.r20,
            ),
            width: 93.w,
            height: 109.h,
            margin: EdgeInsets.only(top: 30.h),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            25.w,
            160.h,
            25.w,
            25.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }
}
