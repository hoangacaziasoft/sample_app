import 'package:acaziasampleapp/core/mapper.dart';
import 'package:acaziasampleapp/data/response/country_response.dart';
import 'package:acaziasampleapp/data/response/summary_response.dart';
import 'package:acaziasampleapp/domain/models/country.dart';
import 'package:acaziasampleapp/domain/models/global.dart';
import 'package:acaziasampleapp/domain/models/summary.dart';
import 'package:injectable/injectable.dart';

@injectable
class SummaryResponseMapper implements Mapper<SummaryResponse, Summary> {
  @override
  Summary mapTo(SummaryResponse from) {
    final global = from.Global;

    final countries = from.Countries.map((country) => Country(
        totalRecovered: country.TotalRecovered,
        newConfirmed: country.NewConfirmed,
        newDeaths: country.NewDeaths,
        newRecovered: country.NewRecovered,
        totalConfirmed: country.TotalConfirmed,
        totalDeaths: country.TotalDeaths,
        slug: country.Slug,
        countryCode: country.CountryCode,
        country: country.Country,
        date: country.Date)).toList();

    return Summary(
        countries: countries,
        global: Global(
            totalDeaths: global.TotalDeaths,
            totalConfirmed: global.TotalConfirmed,
            newRecovered: global.NewRecovered,
            newDeaths: global.NewDeaths,
            newConfirmed: global.NewConfirmed,
            totalRecovered: global.TotalRecovered));
  }
}

@injectable
class CountryResponseMapper implements Mapper<CountryResponse, Country> {
  @override
  Country mapTo(CountryResponse from) => Country(
      date: from.Date,
      country: from.Country,
      countryCode: from.CountryCode,
      newConfirmed: from.NewConfirmed,
      newDeaths: from.NewDeaths,
      newRecovered: from.NewRecovered,
      slug: from.Slug,
      totalConfirmed: from.TotalConfirmed,
      totalRecovered: from.TotalRecovered,
      totalDeaths: from.TotalDeaths);
}
