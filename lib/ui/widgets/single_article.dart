import 'package:biceps_app/models/article.dart';
import 'package:biceps_app/ui/shared/constants.dart';
import 'package:biceps_app/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleArticle extends StatelessWidget {
  final Article article;

  const SingleArticle({
    Key key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Статьи и новости'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // TODO В случае, если есть видео, здесь должно выводиться именно оно.
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  article.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              verticalSpaceMedium,
              Text(
                article.articleTitle,
                style: kSmallHeaderDark,
              ),
              verticalSpaceTiny,
              if (article.articleSubtitle.isNotEmpty)
                Text(article.articleSubtitle),
              verticalSpaceTiny,
              Text('Автор: ${article.articleAuthor}'),
              verticalSpaceTiny,
              Text(DateFormat('dd.MM.yyyy')
                  .format(article.articleDate.toDate())),
              verticalSpaceSmall,
              Text(
                article.articleIntro,
                style: TextStyle(
                  fontSize: 15,
                  color: kPrimaryDarkGrey,
                ),
              ),
              verticalSpaceTiny,
              for (String currentString in article.articleBody)
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 4,
                  ),
                  child: Text(currentString),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
