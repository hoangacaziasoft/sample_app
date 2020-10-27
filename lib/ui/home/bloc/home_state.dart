part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeFailure extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final Summary summary;

  HomeLoaded(this.summary);

  HomeLoaded copyWith(Summary summary){
    return HomeLoaded(summary);
  }

  @override
  // TODO: implement props
  List<Object> get props => [summary];
}
