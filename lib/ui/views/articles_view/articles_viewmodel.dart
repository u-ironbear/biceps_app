import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/app/router.gr.dart';
import 'package:biceps_app/models/article.dart';
import 'package:biceps_app/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ArticlesViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<Article> _articles;
  List<Article> get articles => _articles;

  SingleArticleArguments arguments;

  Future fetchArticles() async {
    setBusy(true);
    var articlesResult = await _firestoreService.getArticles();
    setBusy(false);

    if (articlesResult is List<Article>) {
      _articles = articlesResult;
      notifyListeners();
    } else {
      await _dialogService.showDialog(
        title: 'Произошла ошибка',
        description: articlesResult,
      );
    }
  }

  Future navigateToSingleArticle(index) async {
    arguments = SingleArticleArguments(article: _articles[index]);
    _navigationService.navigateTo(
      Routes.singleArticle,
      arguments: arguments,
    );
  }
}
