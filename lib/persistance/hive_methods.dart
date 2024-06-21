import 'dart:math';

import 'package:hive/hive.dart';
import 'newsmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HiveMethods {
  void saveToHive(NewsModel newsModel) async {
    final newsBox = await Hive.openBox<NewsModel>('newsBox');
    await newsBox.put(newsModel.title, newsModel);
    Hive.close();
  }

  void delete(int index) async {
    final newsBox = await Hive.openBox<NewsModel>('newsBox');
    await newsBox.deleteAt(index);
    Hive.close();
  }
}
