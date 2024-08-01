import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/api/model/news_response/news.dart';
import 'package:news_app/data/data_source_contract/news_data_source.dart';
import 'package:news_app/data/data_source_impl/news_data_source_impl.dart';
import 'package:news_app/data/repository_impl/news_repository_impl.dart';
import 'package:news_app/repository_contract/news_repository.dart';

@injectable
class NewsDetailsViewModel extends Cubit<NewsDetailsState> {
  late NewsRepository newsRepository;

  NewsDetailsViewModel({required this.newsRepository})
      : super(LoadingState(message: 'Loading...'));

  void loadNews(String sourceId) async {
    emit(LoadingState(message: 'Loading...'));
    try {
      var newsList = await newsRepository.getNews(sourceId);
      emit(SuccessState(newsList: newsList));
      // if (response.status == 'error') {
      //   emit(ErrorState(errorMessage: response.message));
      // } else {
      //   emit(SuccessState(newsList: response.articles));
      // }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class NewsDetailsState {}

class LoadingState extends NewsDetailsState {
  String message;

  LoadingState({required this.message});
}

class ErrorState extends NewsDetailsState {
  String? errorMessage;

  ErrorState({this.errorMessage});
}

class SuccessState extends NewsDetailsState {
  List<News>? newsList;

  SuccessState({this.newsList});
}
