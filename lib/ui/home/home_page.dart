import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc.dart';
import 'components/failure_widget.dart';
import 'components/loading_widget.dart';
import 'home_loaded/home_loaded_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingBtn(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return LoadingWidget();
          }
          if (state is HomeFailure) {
            return FailureWidget();
          }
          if (state is HomeLoaded) {
            return HomeLoadedWidget(
              summary: state.summary,
            );
          }

          return LoadingWidget();
        },
      ),
    );
  }

  _floatingBtn(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => BlocProvider.of<HomeBloc>(context).add(FetchData()));
  }
}
