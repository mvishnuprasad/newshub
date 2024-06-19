import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newshub/constants/constants.dart';

import '../models/newsapimodel.dart';

class NewsAPIService {
  final String apiUrl;
  NewsAPIService({required this.apiUrl});
  Future<List<Article>> getNewsData() async {
    try {
      final response = await Dio().get(URLConstants().topHeadlines,
          queryParameters: {
            'country': 'au',
            'apiKey': '353f56640b9e400aab4e5ff95981fb5b'
          });

      if (response.statusCode == 200) {
        List<Article> articles = (response.data['articles'] as List)
            .map((articleJson) => Article.fromJson(articleJson))
            .toList();
        print(articles);
        return articles;
      } else {
        print(response.statusCode);
        return Initializers().emptyList;
      }
    } catch (e) {
      print(e.toString());
      return Initializers().emptyList;
    }
  }
}

final userProvider = Provider<NewsAPIService>(
    (ref) => NewsAPIService(apiUrl: URLConstants().topHeadlines));
