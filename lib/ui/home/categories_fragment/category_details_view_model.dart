import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/Source.dart';
import 'package:news_app/data/data_source_contract/news_source_datasource.dart';
import 'package:news_app/data/data_source_impl/news_source_data_source_impl.dart';
import 'package:news_app/data/repository_impl/news_source_repository_impl.dart';
import 'package:news_app/repository_contract/news_source_repository.dart';

@injectable
class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  late NewsSourceRepository newsSourceRepository;

  @factoryMethod
  CategoryDetailsViewModel({required this.newsSourceRepository})
      : super(LoadingState(message: 'Loading...'));

  void loadSources(String catId) async {
    emit(LoadingState(message: 'Loading....'));
    try {
      var sourcesList = await newsSourceRepository.getSources(catId);
      emit(SuccessState(sourcesList: sourcesList));
      // if (response.status == 'error') {
      //   emit(ErrorState(errorMessage: response.message));
      // } else {
      //   emit(SuccessState(sourcesList: response.sources));
      // }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class CategoryDetailsState {}

class LoadingState extends CategoryDetailsState {
  String message;

  LoadingState({required this.message});
}

class SuccessState extends CategoryDetailsState {
  List<Source>? sourcesList;

  SuccessState({this.sourcesList});
}

class ErrorState extends CategoryDetailsState {
  String? errorMessage;

  ErrorState({this.errorMessage});
}
