import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:technical_test/data/repository/articles.repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IArticleRepository articleRepo;

  HomeBloc({
    required this.articleRepo
  }) : super(HomeInitial()) {

  
  }
}
