import 'package:acaziasampleapp/domain/models/global.dart';
import 'package:flutter/material.dart';

class GlobalTab extends StatelessWidget {
  final Global global;

  GlobalTab({@required this.global}) : assert(global != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _numberCaseWidget('Coronavirus Cases', global.totalConfirmed),
            SizedBox(
              height: 16,
            ),
            _numberCaseWidget('Deaths', global.totalDeaths),
            SizedBox(
              height: 16,
            ),
            _numberCaseWidget('Recovered', global.totalRecovered),
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
}
