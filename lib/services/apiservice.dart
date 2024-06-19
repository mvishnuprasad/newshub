import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:newshub/constants/constants.dart';

import '../models/newsapimodel.dart';

class NewsAPIService {
  String apiUrl = "https://newsapi.org/v2/everything";
//  NewsAPIService({required this.apiUrl});
  Future getNewsData() async {

    try {
      final response = await Dio().get(URLConstants().topHeadlines,
          queryParameters: {
            'country': 'us',
            'apiKey': '353f56640b9e400aab4e5ff95981fb5b'
          });

      if (response.statusCode == 200) {
        if (response.statusCode == 200) {
          List<Article> articles = (response.data['articles'] as List)
              .map((articleJson) => Article.fromJson(articleJson))
              .toList();
          print(articles);
          return response;
        }
      } else {
        print(response.statusCode);
        return response.statusCode.toString();
      }
    } catch (e) {
      print(e.toString());
      return e;
    }
  }
}
