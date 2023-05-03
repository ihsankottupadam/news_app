List<NewsModel> newsModelFromJson(List list) =>
    List<NewsModel>.from(list.map((x) => NewsModel.fromJson(x)));

class NewsModel {
  final String author;
  final String content;
  final String date;
  final String id;
  final String imageUrl;
  final String? readMoreUrl;
  final String time;
  final String title;
  final String url;
  String? category;

  NewsModel({
    required this.author,
    required this.content,
    required this.date,
    required this.id,
    required this.imageUrl,
    this.readMoreUrl,
    required this.time,
    required this.title,
    required this.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        author: json["author"],
        content: json["content"],
        date: json["date"],
        id: json["id"],
        imageUrl: json["imageUrl"],
        readMoreUrl: json["readMoreUrl"],
        time: json["time"],
        title: json["title"],
        url: json["url"],
      );
}
