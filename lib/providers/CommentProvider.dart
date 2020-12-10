import 'package:flutter/material.dart';
import 'package:flutter_app_homeone/entity/Comment.dart';
import 'package:flutter_app_homeone/network/api_response.dart';
import 'package:flutter_app_homeone/repository/CommentRepository.dart';

class CommentProvider with ChangeNotifier {
  CommentRepository _commentRepository;

  ApiResponse<List<Comment>> _getResponse;
  ApiResponse<String> _otherResponse;

  ApiResponse<List<Comment>> get apiResponse => _getResponse;
  ApiResponse<String> get otherResponse => _otherResponse;

  CommentProvider() {
    _commentRepository = CommentRepository();
    getComments();
    addComments();
    deleteComments();
  }

  getComments({BigInt eventId}) async {
    _getResponse = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      List<Comment> comments =
          await _commentRepository.getCommentsByEventIdResitory(eventId);
      _getResponse = ApiResponse.completed(comments);
      notifyListeners();
    } catch (e) {
      _getResponse = ApiResponse.error(e.toString());
    }
  }

  addComments({int eventId, int userId, String comment}) async {
    _otherResponse = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      String res = await _commentRepository.addCommentRepository(
          eventId, userId, comment);
      _otherResponse = ApiResponse.completed(res);
      notifyListeners();
    } catch (e) {
      _otherResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  deleteComments({BigInt commentId, BigInt userId}) async {
    _otherResponse = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      String res =
          await _commentRepository.deleteCommentRepository(commentId, userId);
      _otherResponse = ApiResponse.completed(res);
      notifyListeners();
    } catch (e) {
      _otherResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
