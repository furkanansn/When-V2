
import 'dart:convert';

import 'package:flutter_app_homeone/entity/Comment.dart';
import 'package:flutter_app_homeone/network/api_path.dart';
import 'package:flutter_app_homeone/network/http_client.dart';

class CommentRepository{

  
  Future<List<Comment>> getCommentsByEventIdResitory(BigInt eventId) async{
    final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.get_comments_by_event_id),params: {"eventId": eventId.toString()});
    return response;
  }
  Future<String> addCommentRepository(int eventId,int userId, String comment) async{
  final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.add_comment),
  jsonEncode(<String,String>{

      "comment": comment,
      "event_id": eventId.toString(),
      "user_id": userId.toString(),

  }));
      return response;
  }
  Future<String> deleteCommentRepository(BigInt commentId,BigInt userId) async{
    final response = await HttpClient.instance.deleteData(APIPathHelper.getValue(APIPath.delete_comment),params: {"commentId": commentId.toString(),"userId":userId.toString()});
    return response;
  }


}