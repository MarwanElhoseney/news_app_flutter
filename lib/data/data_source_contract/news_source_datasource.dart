import 'package:news_app/data/api/model/sources_response/Source.dart';

abstract class NewsSourceDataSource {
  Future<List<Source>?> getSources(String catId);
}
