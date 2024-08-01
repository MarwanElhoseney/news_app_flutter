import 'package:news_app/data/api/model/news_response/news.dart';

abstract class NewsDataSource {
  Future<List<News>?> getNews(String sourceId);
}
