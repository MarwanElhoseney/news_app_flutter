import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/model/sources_response/Source.dart';
import 'package:news_app/data/data_source_contract/news_source_datasource.dart';
import 'package:news_app/repository_contract/news_source_repository.dart';

@Injectable(as: NewsSourceRepository)
class NewsSourceRepositoryImpl extends NewsSourceRepository {
  NewsSourceDataSource newsSourceDataSource;

  @factoryMethod
  NewsSourceRepositoryImpl({required this.newsSourceDataSource});

  @override
  Future<List<Source>?> getSources(String catId) {
    return newsSourceDataSource.getSources(catId);
  }
}
