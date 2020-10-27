import 'dart:async';

import 'package:acaziasampleapp/domain/models/summary.dart';
import 'package:acaziasampleapp/domain/usecases/get_country_use_case.dart';
import 'package:acaziasampleapp/domain/usecases/get_summary_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCountryUseCase _getCountryUseCase;
  final GetSummaryUseCase _getSummaryUseCase;

  HomeBloc(this._getCountryUseCase, this._getSummaryUseCase)
      : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchData) {
      yield* _mapFetchDataToState(event);
    }
  }

  Stream<HomeState> _mapFetchDataToState(FetchData event) async* {
    final isLoaded = state is HomeLoaded;

   // if (!isLoaded)
     yield HomeLoading();

    final result = await _getSummaryUseCase();
    yield* result.fold((failure) async* {
      yield HomeFailure();
    }, (summary) async* {
//      if (isLoaded) {
//        yield (state as HomeLoaded).copyWith(summary);
//      } else {
        yield HomeLoaded(summary);
//      }
    });
  }
}
