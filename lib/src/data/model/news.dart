class News {
  final String? id;
  final String? title;
  final String? description;
  final String? content;
  final String? urlToImage;
  final String? publishedAt;
  final String? author;
  final String? url;

  News(
      {this.id,
      this.title,
      this.description,
      this.content,
      this.urlToImage,
      this.publishedAt,
      this.author,
      this.url});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      author: json['author'],
      url: json['url'],
    );
  }
}
