import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'newsmodel.dart';
import '../services/dataprovider.dart';

class HiveMethods {
  //ref.read(savedNewsProvider).state = newsBox.values.toList();
  void saveToHive(String title, String author, String source, String category,
      String? url, String? content) async {
    final newsBox = await Hive.openBox<NewsModel>('newsBox');
    var newsModel = NewsModel(
      title: title,
      author: author,
      source: source,
      category: category,
      url: url,
      description: content,
    );
   // ref.read(savedNewsProvider).state = newsBox.values.toList();
    await newsBox.add(newsModel);
    Hive.close();
  }
}
