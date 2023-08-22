import 'package:flutter/material.dart';

class XImageNetwork extends StatelessWidget {
  const XImageNetwork(
    this.url, {
    super.key,
    this.fit,
  });

  final String? url;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    String domainApi = '';

    if (url?.isNotEmpty != true) {
      return const _PlaceHolder();
    }

    final String fullUrl =
        ((url != null && url!.contains('http')) ? url : ('$domainApi$url'))!;

    return Image.network(
      fullUrl,
      fit: fit,
    );
  }
}

class _PlaceHolder extends StatelessWidget {
  const _PlaceHolder();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
    );
  }
}
