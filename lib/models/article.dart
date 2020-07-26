import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Article {
  final String articleTitle;
  final String articleSubtitle;
  final Timestamp articleDate;
  final String imageUrl;
  final String videoUrl;
  final String articleAuthor;
  final String articleIntro;
  final List<String> articleBody;

  Article({
    @required this.articleTitle,
    this.articleSubtitle,
    this.articleDate,
    this.imageUrl,
    this.videoUrl,
    this.articleAuthor,
    @required this.articleIntro,
    @required this.articleBody,
  });

  Article.fromData(Map<String, dynamic> data)
      : articleTitle = data['title'],
        articleSubtitle = data['subtitle'],
        articleDate = data['date'],
        imageUrl = data['image_url'],
        videoUrl = data['video_url'],
        articleAuthor = data['author'],
        articleIntro = data['intro'],
        articleBody = List.from(data['body']);
}
