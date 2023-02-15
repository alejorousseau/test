import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:technical_test/data/repository/articles.repository.dart';
import 'package:technical_test/domain/models/article/article.cache.dart';
import 'package:technical_test/domain/models/article/article.model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IArticleRepository articleRepo;


  HomeBloc({
    required this.articleRepo,
  }) : super(const HomeInitial( articles: [] )) {

    on<LoadData>((event, emit) async {
      emit(Loading(articles: state.articles));
    
      final articlesList = await articleRepo.get(isRefreshing: event.isRefreshing);
      if(articlesList == null || articlesList.isEmpty) emit(Loaded(articles: state.articles));

      emit(Loaded(articles: articlesList!));

    });
  
  }
}
