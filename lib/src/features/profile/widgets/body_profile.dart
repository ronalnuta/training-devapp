import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/features/profile/widgets/bottom_sheet_logout.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/src/router/router_name.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          15.w,
          50.h,
          15.w,
          20.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, i) => Column(
                children: [_Tile(option: ProfileOption.values[i])],
              ),
              itemCount: ProfileOption.values.length,
            ),
          ],
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final ProfileOption option;
  const _Tile({required this.option});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => option.onTap(),
          splashColor: option.color,
          child: ListTile(
            leading: Image.asset(option.image),
            title: Text(
              option.label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black,
                    fontSize: 19,
                    letterSpacing: -0.41,
                  ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ), // InkWell
      ),
    );
  }
}

enum ProfileOption {
  info,
  changePass,
  logout,
}

extension ProfileOptionExt on ProfileOption {
  String get label {
    switch (this) {
      case ProfileOption.info:
        return 'Thông tin cá nhân';
      case ProfileOption.changePass:
        return 'Thay đổi mật khẩu';
      case ProfileOption.logout:
        return 'Đăng xuất';
      default:
        return '';
    }
  }

  String get image {
    switch (this) {
      case ProfileOption.info:
        return XImage.user;
      case ProfileOption.changePass:
        return XImage.forgotPass;
      case ProfileOption.logout:
        return XImage.logout;
      default:
        return XImage.user;
    }
  }

  Color get color {
    switch (this) {
      case ProfileOption.info:
        return Colors.blue.shade100;
      case ProfileOption.changePass:
        return Colors.yellow.shade100;
      case ProfileOption.logout:
        return Colors.red.shade100;
      default:
        return XColors.primary.withOpacity(0.4);
    }
  }

  void onTap() {
    switch (this) {
      case ProfileOption.info:
        Navigator.pushNamed(XCoordinator.context, XRouterName.info);
        break;
      case ProfileOption.changePass:
        onPressed();
        break;
      case ProfileOption.logout:
        showCupertinoModalBottomSheet(
          context: XCoordinator.context,
          builder: (_) => const BottomSheetLogout(),
        );
        break;
      default:
        break;
    }
  }

  void onPressed() {
    XToast.show(
        "Chức năng đang được phát triển. Sẽ có sẵn trong phiên bản tiếp theo");
  }
}
