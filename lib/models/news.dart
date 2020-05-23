class News {
  String title;
  List<String> content;
  String imagePath;
  String createdDate;
  String viewCount;

  News({this.title, this.createdDate, this.viewCount, this.imagePath, this.content});

  News.copyFrom(News news) {
    this.title = news.title;
    this.createdDate = news.createdDate;
    this.viewCount = news.viewCount;
    this.imagePath = news.imagePath;
    this.content = news.content;
  }
}