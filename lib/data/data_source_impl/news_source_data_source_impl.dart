import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/Source.dart';
import 'package:news_app/data/data_source_contract/news_source_datasource.dart';

@Injectable(as: NewsSourceDataSource)
class NewsSourceDataSourceImpl extends NewsSourceDataSource {
  ApiManager apiManager;

  @factoryMethod
  NewsSourceDataSourceImpl({required this.apiManager});

  @override
  Future<List<Source>?> getSources(String catId) async {
    var response = await apiManager.getSources(catId);
    return response.sources;
  }
}

class NewsOfflineSourceDataSourceImpl extends NewsSourceDataSource {
  ApiManager apiManager;

  NewsOfflineSourceDataSourceImpl({required this.apiManager});

  @override
  Future<List<Source>?> getSources(String catId) async {
    var response = await apiManager.getSources(catId);
    return response.sources;
  }
}
