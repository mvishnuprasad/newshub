class NewsResponse {
  String status;
  int totalResults;
  List<Article> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    var articlesList = json['articles'] as List;
    List<Article> articles =
    articlesList.map((articleJson) => Article.fromJson(articleJson)).toList();

    return NewsResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articles,
    );
  }
}

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String? urlToImage;
  String publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );
  }
}

class Source {
  String? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'] ?? "",
    );
  }
}
