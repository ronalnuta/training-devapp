import 'package:flutter/material.dart';
import 'package:my_app/src/localization/localization_utils.dart';

class XStateErrorWidget extends StatelessWidget {
  const XStateErrorWidget({
    this.onReload,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onReload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onReload,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.error_outline),
            Text(S.of(context).error_somethingWrongTryAgain),
          ],
        ),
      ),
    );
  }
}
