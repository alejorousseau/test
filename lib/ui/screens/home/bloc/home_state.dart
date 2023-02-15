part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final List<Article> articles; 
  const HomeState({
    required this.articles
  });
  
  @override
  List<Object> get props => [];
}

class Loaded extends HomeState {
  const Loaded({ required super.articles });
}

class Loading extends HomeState {
  const Loading({ required super.articles });
}

class HomeInitial extends HomeState {
  const HomeInitial({ required super.articles });
}
