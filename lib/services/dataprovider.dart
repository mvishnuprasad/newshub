import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newshub/models/newsapimodel.dart';
import '../constants/url_constants.dart';
import '../persistance/newsmodel.dart';
import 'apiservice.dart';

final countryProvider = FutureProvider<List<Article>>((ref) =>
    NewsAPIService(('country', 'us'), apiUrl: URLConstants().topHeadlines)
        .getNewsData());

final categoryProvider = FutureProvider<List<Article>>((ref) =>
    NewsAPIService(('category', 'sports'), apiUrl: URLConstants().topHeadlines)
        .getNewsData());

var savedNewsProvider = StateProvider<List<NewsModel>>((ref) => []);
var savedTitleProvider = StateProvider<List<String>>((ref) => []);
