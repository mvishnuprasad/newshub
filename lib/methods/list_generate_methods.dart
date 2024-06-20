import 'package:flutter/material.dart';

import '../components/newscard.dart';
import '../components/stackednewscard.dart';
import '../constants/initializers.dart';
import '../constants/url_constants.dart';
import '../models/newsapimodel.dart';

List<Widget> generateStackedNewsCards(List<Article> articleList) {
  return List.generate(
      articleList.length,
      (index) => StackedNewsCard(
            title: (articleList[index].title.isEmpty ||
                    articleList[index].title == "[Removed]")
                ? TempNews().title
                : articleList[index].title,
            author: (articleList[index].author.isEmpty ||
                    articleList[index].author == "[Removed]")
                ? "Ron Miller"
                : articleList[index].author,
            source: (articleList[index].source.name.isEmpty ||
                    articleList[index].source.name == "[Removed]")
                ? "CNN"
                : articleList[index].source.name,
            category: (articleList[index].publishedAt.isEmpty ||
                    articleList[index].publishedAt == "[Removed]")
                ? "Geopolitics"
                : articleList[index].publishedAt.substring(11, 16),
            url: articleList[index].urlToImage,
          ));
}

NewsCard newsCard(List<Article> articleList, int index) {
  return NewsCard(
    title: (articleList[index].title.isEmpty ||
            articleList[index].title == "[Removed]")
        ? TempNews().title
        : articleList[index].title,
    author: (articleList[index].author.isEmpty ||
            articleList[index].author == "[Removed]")
        ? "Ron Miller"
        : articleList[index].author,
    source: (articleList[index].source.name.isEmpty ||
            articleList[index].source.name == "[Removed]")
        ? "CNN"
        : articleList[index].source.name,
    category: (articleList[index].publishedAt.isEmpty ||
            articleList[index].publishedAt == "[Removed]")
        ? "Geopolitics"
        : articleList[index].publishedAt.substring(11, 16),
    url: articleList[index].urlToImage,
    content: articleList[index].content.isEmpty ||
            articleList[index].content == "[Removed]"
        ? TempNews().description
        : articleList[index].content,
  );
}
