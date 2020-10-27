import 'package:acaziasampleapp/app.dart';
import 'package:acaziasampleapp/ui/country_detail/country_detail_page.dart';
import 'package:acaziasampleapp/ui/route/named_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> routers(RouteSettings settings) {
  Widget screen;

//  final args = settings.arguments as Map<String, dynamic>;
  final arg = settings.arguments;

  switch (settings.name) {
    case NamedRoute.myApp:
      screen = MyApp();
      break;
    case NamedRoute.countryDetail:
      screen = CountryDetailPage(
        country: arg,
      );
      break;
  }

  return MaterialPageRoute(builder: (_) => screen);
}
