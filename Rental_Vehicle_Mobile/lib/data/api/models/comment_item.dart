import 'package:get/get.dart';

import 'response/user/TUser.dart';

class CommentItem {
  String? content;
  String? createdAt;
  String? id;
  RxBool? isFavorite = false.obs;
  int? numberOfComment;
  int? numberOfFavorite;
  String? parent;
  String? post;
  TUser? reply;
  String? updatedAt;
  TUser? user;

  CommentItem(
      {this.content,
      this.createdAt,
      this.id,
      this.isFavorite,
      this.numberOfComment,
      this.numberOfFavorite,
      this.parent,
      this.post,
      this.reply,
      this.updatedAt,
      this.user});

  CommentItem.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['createdAt'];
    id = json['id'];
    isFavorite!.value = json['isFavorite'] ?? false;
    numberOfComment = json['numberOfComment'];
    numberOfFavorite = json['numberOfFavorite'];
    parent = json['parent'];
    post = json['post'];
    reply = json['reply'] != null ? new TUser.fromJson(json['reply']) : null;
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new TUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    data['isFavorite'] = this.isFavorite;
    data['numberOfComment'] = this.numberOfComment;
    data['numberOfFavorite'] = this.numberOfFavorite;
    data['parent'] = this.parent;
    data['post'] = this.post;
    if (this.reply != null) {
      data['reply'] = this.reply!.toJson();
    }
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
