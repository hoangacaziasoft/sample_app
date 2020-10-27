import 'package:acaziasampleapp/domain/models/country.dart';
import 'package:acaziasampleapp/ui/route/named_route.dart';
import 'package:flutter/material.dart';

class CountriesTab extends StatelessWidget {
  final List<Country> countries;

  CountriesTab({@required this.countries}) : assert(countries != null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: countries.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final country = countries[index];

          return ListTile(
            onTap: () => Navigator.pushNamed(context, NamedRoute.countryDetail,
                arguments: country),
            title: Text(
              country.country,
              style: TextStyle(color: Colors.blue),
            ),
            trailing: Text(country.totalConfirmed.toString()),
          );
        });
  }
}
