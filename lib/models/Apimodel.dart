import 'package:weatherapp/models/Model.dart';

class NewsResponse {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  NewsResponse({this.status, this.totalResults, this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: (json['articles'] as List<dynamic>?)
          ?.map((articleJson) => Article.fromJson(articleJson))
          .toList(),
    );
  }
}

class Source {
  final String? id;
  final String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
