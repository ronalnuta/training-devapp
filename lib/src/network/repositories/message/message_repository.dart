import 'package:my_app/src/network/model/common/base_model.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/message/message_content_model.dart';
import 'package:my_app/src/network/model/message/message_model.dart';
import 'package:my_app/src/network/model/message/message_sent_model.dart';
import 'package:my_app/src/network/model/message/unread_message_model.dart';

abstract class MessageRepository {
  Future<XResult<BaseModel<List<MessageModel>>>> getListMessage({
    required int pageNumber,
    required String token,
  });

  Future<XResult<MessageContentModel>> getMessageContent({
    required int id,
    required String token,
  });

  Future<XResult<BaseModel<List<MessageSentModel>>>> getListMessageSent({
    required int pageNumber,
    required String token,
  });

  Future<XResult<UnreadMessageModel>> getUnreadMessageNumber(String token);
}
