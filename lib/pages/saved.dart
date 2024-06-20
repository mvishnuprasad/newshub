import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../persistance/newsmodel.dart';

class SavedArticles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved News'),
      ),
      body: FutureBuilder<Box<NewsModel>>(
        future: Hive.openBox<NewsModel>('newsBox'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var newsBox = snapshot.data!;
            var savedNews = newsBox.values.toList();
            return ListView.builder(
              itemCount: savedNews.length,
              itemBuilder: (context, index) {
                var news = savedNews[index];
                return ListTile(
                  title: Text(news.title),
                  subtitle: Text(news.source),
                  // Add more details or customize as needed
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
