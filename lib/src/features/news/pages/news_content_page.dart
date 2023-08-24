import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:my_app/src/features/news/cubit/news_content_bloc.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/widgets/common/empty_widget.dart';
import 'package:my_app/widgets/common/indicator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsContentPage extends StatelessWidget {
  final int newsId;
  const NewsContentPage({super.key, required this.newsId});

  @override
  Widget build(BuildContext context) {
    ScrollController horizontalController = ScrollController();
    ScrollController verticalController = ScrollController();

    return BlocProvider(
      create: (_) => NewsContentBloc(newsId),
      child: BlocBuilder<NewsContentBloc, NewsContentState>(
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Nội dung thông báo",
                textAlign: TextAlign.center,
              ),
            ),
            body: state.isLoading
                ? const XIndicator()
                : state.data == null
                    ? const EmptyWidget()
                    : Scrollbar(
                        controller: verticalController,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          controller: verticalController,
                          child: Scrollbar(
                            controller: horizontalController,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              controller: horizontalController,
                              child: Html(
                                data: state.data!.content,
                                customRenders: {
                                  tableMatcher(): tableRender(),
                                  networkSourceMatcher(): networkImageRender(
                                    headers: {"Custom-Header": "some-value"},
                                    altWidget: (alt) => Text(alt ?? ""),
                                    loadingWidget: () => const SpinKitWave(
                                      color: XColors.primary,
                                      size: 30.0,
                                    ),
                                  ),
                                },
                                shrinkWrap: true,
                                style: {
                                  "table": Style(backgroundColor: Colors.white),
                                  "tr": Style(
                                    padding: const EdgeInsets.all(2),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  "th": Style(
                                    padding: const EdgeInsets.all(2),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  "td": Style(
                                    padding: const EdgeInsets.all(2),
                                    border: Border.all(color: Colors.black),
                                  ),
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
          );
        },
        buildWhen: (p, c) => p.data != c.data || p.isLoading != c.isLoading,
      ),
    );
  }
}
