import 'package:dio/dio.dart';
import 'package:my_app/src/config/constants/endpoints.dart';
import 'package:my_app/src/network/data_sources/base_data_source.dart';
import 'package:my_app/src/network/model/common/base_model.dart';
import 'package:my_app/src/network/model/news/news_content_model.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/news/news_model.dart';
import 'package:my_app/src/network/repositories/news/news_repository.dart';
import 'package:my_app/src/utils/helper/logger.dart';

class NewsRepositoryImpl extends NewsRepository {
  @override
  Future<XResult<NewsContentModel>> getNewsContent({
    required int id,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.getNewsContent}/${id.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(
        response.data,
        (p0) => NewsContentModel.fromMap(p0),
      );

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET NEWS CONTENT CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<BaseModel<List<NewsModel>>>> getListNews({
    required int numberPage,
    required String token,
    required String startDay,
    required String endDay,
  }) async {
    try {
      var a = "";
      var b = "";
      if (startDay.isNotEmpty) {
        startDay = startDay.replaceAll("/", "%2F");
        a = "&start_date=$startDay";
      }
      if (endDay.isNotEmpty) {
        endDay = endDay.replaceAll("/", "%2F");
        b = "&end_date=$endDay";
      }

      final response = await BaseDataSource().get(
        "${Endpoints.getListNews}?page_number=${numberPage.toString()}$a$b",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<NewsModel> list = [];
        p0['list'].forEach((v) {
          list.add(NewsModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result)
          : XResult.error(result.message);
    } catch (e, a) {
      LoggerHelper.error('> GET LIST NEWS CATCH Error< $e $a');

      return XResult.exception(e);
    }
  }
}
