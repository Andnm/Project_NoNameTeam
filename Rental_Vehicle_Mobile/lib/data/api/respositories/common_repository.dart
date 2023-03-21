import 'package:get/get.dart';

import '/data/api/models/comment_item.dart';
import '/data/api/models/discover_item.dart';
import '/data/api/services/common_service.dart';
import 'base_repository.dart';

class CommonRepository extends BaseRepository {
  final _commonService = Get.find<CommonService>();

  Future<List<DiscoverItem>> getDiscovers({required int page, String? topicId}) async {
    final response = await _commonService.getDiscovers(page: page, topicId: topicId);
    return response;
  }

  Future<void> favoritePost({required String postId}) async {
    await _commonService.favoritePost(postId: postId);
  }

  Future<void> unFavoritePost({required String postId}) async {
    await _commonService.unFavoritePost(postId: postId);
  }

  Future<List<CommentItem>> getComments({required String postId, required int page}) async {
    final response = await _commonService.getComments(postId: postId, page: page);
    return response;
  }

  Future<CommentItem> createComment({required String postId, required String content}) async {
    final comment = await _commonService.createComment(postId: postId, content: content);
    return comment;
  }
}
