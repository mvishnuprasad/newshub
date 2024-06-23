
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'newsmodel.dart';

class HiveMethods {
  void saveToHive(NewsModel newsModel) async {
    final newsBox = await Hive.openBox<NewsModel>('newsBox');
    if (newsBox.containsKey(newsModel.title) == false) {
      await newsBox.put(newsModel.title, newsModel);
      debugPrint('SAVED ${newsModel.title}');
    } else {
      await newsBox.delete(newsModel.title);
      debugPrint('DELETE ${newsModel.title}');
      Hive.close();
    }
  }

  void delete(NewsModel newsModel) async {
    final newsBox = await Hive.openBox<NewsModel>('newsBox');
    await newsBox.delete(newsModel.title);
    debugPrint('DELETED ${newsModel.title}');
  }
}
