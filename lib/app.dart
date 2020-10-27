import 'package:acaziasampleapp/di/di.dart';
import 'package:acaziasampleapp/ui/home/bloc/home_bloc.dart';
import 'package:acaziasampleapp/ui/home/home_page.dart';
import 'package:acaziasampleapp/ui/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, canvasColor: Colors.white),
      initialRoute: '/',
      onGenerateRoute: routers,
      home: BlocProvider(
        create: (_) => getIt<HomeBloc>()..add(FetchData()),
        child: HomePage(),
      ),
    );
  }
}
