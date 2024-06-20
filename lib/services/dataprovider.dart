import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newshub/models/newsapimodel.dart';
import '../constants/url_constants.dart';
import '../persistance/newsmodel.dart';
import 'apiservice.dart';

final countryProvider = Provider<NewsAPIService>((ref) =>
    NewsAPIService(('country', 'us'), apiUrl: URLConstants().topHeadlines));

final categoryProvider = Provider<NewsAPIService>((ref) => NewsAPIService(
    ('category', 'sports'),
    apiUrl: URLConstants().topHeadlines));

final bookmarkedProvider = StateProvider<(bool,int)>((ref) => (false,0));
final savedNewsProvider = StateProvider<List<NewsModel>>((ref) => []);

final countryDataProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(countryProvider).getNewsData();
});
final categoryDataProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(categoryProvider).getNewsData();
});
