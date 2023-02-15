part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadData extends HomeEvent {
  final bool isRefreshing;
  const LoadData({
     this.isRefreshing = false
  });
}