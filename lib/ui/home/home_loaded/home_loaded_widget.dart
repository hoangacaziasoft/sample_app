import 'package:acaziasampleapp/domain/models/global.dart';
import 'package:acaziasampleapp/domain/models/summary.dart';
import 'package:acaziasampleapp/ui/home/home_loaded/tabs/countries_tab.dart';
import 'package:acaziasampleapp/ui/home/home_loaded/tabs/global_tab.dart';
import 'package:flutter/material.dart';

class HomeLoadedWidget extends StatefulWidget {
  final Summary summary;

  HomeLoadedWidget({@required this.summary}) : assert(summary != null);

  @override
  _HomeLoadedWidgetState createState() => _HomeLoadedWidgetState();
}

class _HomeLoadedWidgetState extends State<HomeLoadedWidget> {
  int _iTab = 0;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (i) {
              setState(() {
                _iTab = i;
              });
            },
            children: <Widget>[
              GlobalTab(
                global: widget.summary.global,
              ),
              CountriesTab(
                countries: widget.summary.countries,
              )
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.public), title: Text('Global')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), title: Text('Countries'))
        ],
        currentIndex: _iTab,
        onTap: (i) {
          setState(() {
            _iTab = i;
            _pageController.animateToPage(_iTab,
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn);
          });
        },
      ),
    );
  }
}
