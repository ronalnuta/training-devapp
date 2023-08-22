import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/home/cubit/home_bloc.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/widgets/common/empty_widget.dart';

class BadgeMessage extends StatelessWidget {
  const BadgeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        final number = state.unreadMessage.number;

        return number < 1
            ? const EmptyWidget()
            : Container(
                decoration: BoxDecoration(
                  color: XColors.red.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                width: 23,
                height: 23,
                child: Center(
                  child: AutoSizeText(
                    "$number${number > 99 ? " +" : ""}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    minFontSize: 6,
                    maxFontSize: 12,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              );
      },
      buildWhen: (p, c) => p.unreadMessage != c.unreadMessage,
    );
  }
}
