import 'package:biceps_app/ui/shared/constants.dart';
import 'package:biceps_app/ui/views/articles_view/articles_viewmodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class ArticlesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArticlesViewModel>.reactive(
      builder: (context, model, child) => Container(
        child: model.articles != null
            ? ListView.builder(
                itemCount: model.articles.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  height: 250,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          model.articles[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        height: 75,
                        width: MediaQuery.of(context).size.width - 40.0,
                        child: GestureDetector(
                          onTap: () => model.navigateToSingleArticle(index),
                          onLongPress: null,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black12,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                model.articles[index].articleTitle.length < 36
                                    ? Text(
                                        model.articles[index].articleTitle,
                                        style: TextStyle(fontSize: 15),
                                      )
                                    : Text(
                                        '${model.articles[index].articleTitle.substring(0, 34)}...',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                model.articles[index].articleIntro.length < 90
                                    ? Text(
                                        model.articles[index].articleIntro,
                                        style: TextStyle(fontSize: 12),
                                      )
                                    : Text(
                                        '${model.articles[index].articleIntro.substring(0, 88)}...',
                                        style: TextStyle(fontSize: 12),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: SpinKitFadingCircle(
                  color: kPrimaryAccent,
                  size: 50,
                ),
              ),
      ),
      viewModelBuilder: () => ArticlesViewModel(),
      onModelReady: (model) => model.fetchArticles(),
    );
  }
}
