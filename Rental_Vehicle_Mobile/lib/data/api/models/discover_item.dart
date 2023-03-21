import 'package:get/state_manager.dart';

import '/data/api/models/topic_item.dart';
import 'response/user/TUser.dart';

class DiscoverItem {
  String? content;
  String? cover;
  String? createdAt;
  TUser? createdBy;
  String? description;
  String? id;
  RxBool? isFavorite = false.obs;
  bool? isShare;
  RxInt? numberOfComment = 0.obs;
  RxInt? numberOfFavorite = 0.obs;
  int? numberOfShare;
  String? title;
  List<TopicItem>? topics;
  List<String>? images;

  DiscoverItem(
      {this.content,
      this.cover,
      this.createdAt,
      this.createdBy,
      this.description,
      this.id,
      this.isFavorite,
      this.isShare,
      this.numberOfComment,
      this.numberOfFavorite,
      this.numberOfShare,
      this.title,
      this.topics,
      this.images});

  DiscoverItem.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    cover = json['cover'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'] != null ? new TUser.fromJson(json['createdBy']) : null;
    description = json['description'];
    id = json['id'];
    isFavorite!.value = json['isFavorite'] ?? false;
    isShare = json['isShare'];
    numberOfComment!.value = json['numberOfComment'];
    numberOfFavorite!.value = json['numberOfFavorite'] ?? 0;
    numberOfShare = json['numberOfShare'];
    title = json['title'];
    images = json['cover'] != null ? [json['cover']] : [];
    if (json['topics'] != null) {
      topics = <TopicItem>[];
      json['topics'].forEach((v) {
        topics!.add(new TopicItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['cover'] = this.cover;
    data['createdAt'] = this.createdAt;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    data['description'] = this.description;
    data['id'] = this.id;
    data['isFavorite'] = this.isFavorite;
    data['isShare'] = this.isShare;
    data['numberOfComment'] = this.numberOfComment;
    data['numberOfFavorite'] = this.numberOfFavorite;
    data['numberOfShare'] = this.numberOfShare;
    data['title'] = this.title;
    if (this.topics != null) {
      data['topics'] = this.topics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
