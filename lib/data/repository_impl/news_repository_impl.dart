import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/model/news_response/news.dart';
import 'package:news_app/data/data_source_contract/news_data_source.dart';
import 'package:news_app/repository_contract/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  NewsDataSource newsDataSource;

  @factoryMethod
  NewsRepositoryImpl({required this.newsDataSource});

  @override
  Future<List<News>?> getNews(String sourceId) {
    return newsDataSource.getNews(sourceId);
  }
}
