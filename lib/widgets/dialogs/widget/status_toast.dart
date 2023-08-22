import 'package:flutter/material.dart';

class XStatusToast extends StatelessWidget {
  const XStatusToast(
    this.message, {
    this.icon,
    Key? key,
  }) : super(key: key);
  final Widget? icon;
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xCC000000),
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: 4)],
          Flexible(
            child: Text(
              message ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
