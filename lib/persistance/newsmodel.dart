import 'package:hive/hive.dart';

part 'newsmodel.g.dart';


@HiveType(typeId: 0,adapterName: "NewsModelAdapter")
class NewsModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String author;

  @HiveField(2)
  String source;

  @HiveField(3)
  String category;

  @HiveField(4)
  String? url;

  @HiveField(5)
  String? description;

  NewsModel({
    required this.title,
    required this.author,
    required this.source,
    required this.category,
    this.url,
    this.description,
  });
}
