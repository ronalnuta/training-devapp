import 'package:flutter/material.dart';
import 'package:my_app/widgets/common/indicator.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: XIndicator());
  }
}
