import 'package:acaziasampleapp/domain/models/country.dart';
import 'package:flutter/material.dart';

class CountryDetailPage extends StatelessWidget {
  final Country country;

  CountryDetailPage({@required this.country}) : assert(country != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.country),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _numberCaseWidget('Coronavirus Cases', country.totalConfirmed),
            SizedBox(
              height: 16,
            ),
            _numberCaseWidget('Deaths', country.totalDeaths),
            SizedBox(
              height: 16,
            ),
            _numberCaseWidget('Recovered', country.totalRecovered),
            SizedBox(
              height: 32,
            ),
            _closedCasesWidget(context),
          ],
        ),
      ),
    );
  }

  _numberCaseWidget(String title, int number) {
    final txtTitle = Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
    );
    final txtNumber = Text(
      number.toString(),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[txtTitle, txtNumber],
    );
  }

  _closedCasesWidget(BuildContext context) {
    final closedCaseNumber = country.totalRecovered + country.totalDeaths;

    final txtTitle = Text(
      'CLOSED CASES',
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
    );
    final txtNumber = Text(
      closedCaseNumber.toString(),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              txtTitle,
              SizedBox(
                height: 8,
              ),
              txtNumber
            ],
          ),
        ),
      ),
    );
  }
}
