import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/theme/colors.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showLeading;

  const XAppBar({
    Key? key,
    this.title,
    this.showLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !showLeading
          ? null
          : Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: Size(40.w, 40.w),
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                  backgroundColor: XColors.diableButton,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Text(
          title ?? "",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: XColors.diableButton),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

// MediaQuery.of(XCoordinator.context).padding.top is status bar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
