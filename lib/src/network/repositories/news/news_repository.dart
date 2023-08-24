import 'package:my_app/src/network/model/common/base_model.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/news/news_content_model.dart';
import 'package:my_app/src/network/model/news/news_model.dart';

abstract class NewsRepository {
  Future<XResult<NewsContentModel>> getNewsContent({
    required int id,
    required String token,
  });

  Future<XResult<BaseModel<List<NewsModel>>>> getListNews({
    required int numberPage,
    required String token,
    required String startDay,
    required String endDay,
  });
}
