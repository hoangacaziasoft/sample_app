import 'package:acaziasampleapp/domain/models/country.dart';
import 'package:acaziasampleapp/domain/models/global.dart';
import 'package:acaziasampleapp/domain/models/summary.dart';
import 'package:acaziasampleapp/domain/usecases/get_summary_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../utils/test_mocks.dart';

void main() {
  final repository = MockAppRepository();
  final usecase = GetSummary(repository);

  test('Execute should call get method', () async {
    await usecase();
    verify(repository.getSummary());
  });

  final summary = Summary(
      global: Global(
          totalDeaths: 1,
          totalConfirmed: 2,
          newRecovered: 3,
          newDeaths: 4,
          newConfirmed: 5,
          totalRecovered: 0),
      countries: [
        Country(
            totalRecovered: 1,
            newConfirmed: 2,
            newDeaths: 3,
            newRecovered: 4,
            totalConfirmed: 5,
            totalDeaths: 6,
            date: '20/20/2020',
            countryCode: '30',
            country: 'Vietnam',
            slug: 'vn')
      ]);

  test('Excute should return summary data from repository', () async {
    when(repository.getSummary()).thenAnswer((_) async => Right(summary));
    final result = await usecase();

    expect(result, Right(summary));
    verify(repository.getSummary());
    verifyNoMoreInteractions(repository);
  });
}
