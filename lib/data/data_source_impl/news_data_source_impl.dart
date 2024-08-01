import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/api/model/news_response/news.dart';
import 'package:news_app/data/data_source_contract/news_data_source.dart';

@Injectable(as: NewsDataSource)
class NewsDataSourceImpl extends NewsDataSource {
  ApiManager apiManager;

  @factoryMethod
  NewsDataSourceImpl({required this.apiManager});

  @override
  Future<List<News>?> getNews(String sourceId) async {
    var response = await apiManager.getNews(sourceId);
    return response.articles;
  }
}
