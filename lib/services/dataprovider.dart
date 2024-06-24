import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newshub/models/newsapimodel.dart';
import '../constants/url_constants.dart';
import '../persistance/newsmodel.dart';
import 'apiservice.dart';

final countryProvider = FutureProvider<List<Article>>((ref) =>
    NewsAPIService(('country', 'us'), apiUrl: URLConstants().topHeadlines)
        .getNewsData());

FutureProvider<List<Article>> categoryProvider(String category) {
  return FutureProvider<List<Article>>((ref) =>
      NewsAPIService(('category', category), apiUrl: URLConstants().topHeadlines)
          .getNewsData());
}

FutureProvider<List<Article>> searchProvider(String searchTerm) {
  return FutureProvider<List<Article>>((ref) =>
      NewsAPIService(('q', searchTerm), apiUrl: URLConstants().everyThing)
          .getNewsData());
}
final sportsProvider = categoryProvider('sports');
final entertainmentProvider = categoryProvider('entertainment');
final generalProvider = categoryProvider('general');
final healthProvider = categoryProvider('health');
final scienceProvider = categoryProvider('science');
final technologyProvider = categoryProvider('technology');
final businessProvider = categoryProvider('business');

var savedNewsProvider = StateProvider<List<NewsModel>>((ref) => []);
var savedTitleProvider = StateProvider<List<String>>((ref) => []);
var headLinesProvider = StateProvider<List<Article>>((ref) => []);