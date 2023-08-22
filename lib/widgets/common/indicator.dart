import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/theme/colors.dart';

class XIndicator extends StatelessWidget {
  const XIndicator({
    this.radius = 15,
    Key? key,
  }) : super(key: key);
  final double radius;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Center(
        child: SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            color: XColors.primary,
            strokeWidth: 1.5,
          ),
        ),
      );
    }

    return Center(
      child: CupertinoActivityIndicator(
        color: XColors.primary,
        radius: radius,
      ),
    );
  }
}
