import 'package:flutter/material.dart';

class DismissKeyBoard extends StatelessWidget {
  const DismissKeyBoard({this.child, Key? key}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) => _hideKeyboard(context),
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }

  void _hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
