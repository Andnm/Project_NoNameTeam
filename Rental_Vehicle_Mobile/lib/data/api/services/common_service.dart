import 'package:sprintf/sprintf.dart';

import '/data/api/api_constants.dart';
import '/data/api/models/comment_item.dart';
import '/data/api/models/discover_item.dart';
import 'base_service.dart';

class CommonService extends BaseService {
  Future<List<DiscoverItem>> getDiscovers({required int page, String? topicId}) async {
    final response = await get(LIST_DISCOVERY, params: {"page": page, "limit": PAGE_SIZE, "topic_eq": topicId ?? ""});
    return List<DiscoverItem>.from(response.data.map((item) => DiscoverItem.fromJson(item)));
  }

  Future<void> favoritePost({required String postId}) async {
    await post(sprintf(FAVORITE_POST, [postId]));
  }

  Future<void> unFavoritePost({required String postId}) async {
    await delete(sprintf(FAVORITE_POST, [postId]));
  }

  Future<List<CommentItem>> getComments({required String postId, required int page}) async {
    final response = await get(POST_COMMENT, params: {"page": page, "limit": PAGE_SIZE, "post_eq": postId});
    return List<CommentItem>.from(response.data.map((item) => CommentItem.fromJson(item)));
  }

  Future<CommentItem> createComment({required String postId, required String content}) async {
    final response = await post(POST_COMMENT, data: {"content": content, "post": postId});
    return CommentItem.fromJson(response.data);
  }
}
