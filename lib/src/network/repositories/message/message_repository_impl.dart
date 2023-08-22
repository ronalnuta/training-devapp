import 'package:dio/dio.dart';
import 'package:my_app/src/config/constants/endpoints.dart';
import 'package:my_app/src/network/data_sources/base_data_source.dart';
import 'package:my_app/src/network/model/common/base_model.dart';
import 'package:my_app/src/network/model/message/message_content_model.dart';
import 'package:my_app/src/network/model/message/message_model.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/message/message_sent_model.dart';
import 'package:my_app/src/network/model/message/unread_message_model.dart';
import 'package:my_app/src/network/repositories/message/message_repository.dart';
import 'package:my_app/src/utils/helper/logger.dart';

class MessageRepositoryImpl extends MessageRepository {
  @override
  Future<XResult<BaseModel<List<MessageModel>>>> getListMessage({
    required int pageNumber,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.getListMessage}/${pageNumber.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<MessageModel> list = [];
        p0['list'].forEach((v) {
          list.add(MessageModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET LIST MESSAGE CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<MessageContentModel>> getMessageContent({
    required int id,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.getMessageContent}/${id.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(
        response.data,
        (p0) => MessageContentModel.fromMap(p0),
      );

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET MESSAGE CONTENT CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<BaseModel<List<MessageSentModel>>>> getListMessageSent({
    required int pageNumber,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.getListMessageSent}/${pageNumber.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<MessageSentModel> list = [];
        p0['list'].forEach((v) {
          list.add(MessageSentModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET LIST MESSAGE SENT CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<UnreadMessageModel>> getUnreadMessageNumber(
    String token,
  ) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getUnreadMessageNumber,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(
        response.data,
        (p0) => UnreadMessageModel.fromMap(p0),
      );

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET UNREAD MESSAGE CATCH Error< $e');

      return XResult.exception(e);
    }
  }
}
