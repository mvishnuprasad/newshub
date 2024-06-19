import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newshub/constants/constants.dart';

import '../models/newsapimodel.dart';

class NewsAPIService {
  String apiUrl = "https://newsapi.org/v2/everything";
//  NewsAPIService({required this.apiUrl});
  Future <List<Article>> getNewsData() async {
    final List<Article> emptyList = [Article(source: Source(id: "id", name: "name"), author: "author", title: "title", description: "description", url: "url", urlToImage: "urlToImage",
        publishedAt: "publishedAt", content: "content")];
    try {
      final response = await Dio().get(URLConstants().topHeadlines,
          queryParameters: {
            'country': 'us',
            'apiKey': '353f56640b9e400aab4e5ff95981fb5b'
          });

        if (response.statusCode == 200) {
          List<Article> articles = (response.data['articles'] as List)
              .map((articleJson) => Article.fromJson(articleJson))
              .toList();
          print(articles);
          return articles;
        }
       else {
        print(response.statusCode);
        return emptyList;
      }
    } catch (e) {
      print(e.toString());
      return emptyList;
    }

  }
}

final userProvider = Provider<NewsAPIService>((ref) => NewsAPIService());
