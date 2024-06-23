import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:newshub/constants/url_constants.dart';
import '../constants/api_constants.dart';
import '../constants/initializers.dart';
import '../models/newsapimodel.dart';

class NewsAPIService {
  final String apiUrl;
  final (String, String) queryParameter;
  NewsAPIService(this.queryParameter, {required this.apiUrl});
  Future<List<Article>> getNewsData() async {
    try {
      final response = await Dio().get(URLConstants().topHeadlines,
          queryParameters: {
            queryParameter.$1 : queryParameter.$2,
            'apiKey': Auth().apiKey
          });

      if (response.statusCode == 200) {
        List<Article> articles = (response.data['articles'] as List)
            .map((articleJson) => Article.fromJson(articleJson))
            .toList();
        return articles;
      } else {
        debugPrint("${response.statusCode}");
        return Initializers.emptyList;
      }
    } catch (e) {
      debugPrint(e.toString());
      return Initializers.emptyList;
    }
  }
}


