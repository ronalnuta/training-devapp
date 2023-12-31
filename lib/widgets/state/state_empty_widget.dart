import 'package:flutter/material.dart';

class XStateEmptyWidget extends StatelessWidget {
  const XStateEmptyWidget({
    this.title,
    this.body,
    this.child,
    Key? key,
  }) : super(key: key);

  final String? title;
  final String? body;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.inventory_2_outlined),
          const SizedBox(height: 20),
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title!,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          if (body != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(body!, textAlign: TextAlign.center),
            ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
