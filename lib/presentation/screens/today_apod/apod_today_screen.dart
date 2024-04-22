import 'package:flutter/material.dart';
import 'package:tdd_clean_arch/container_injections.dart';
import 'package:tdd_clean_arch/presentation/blocs/today_apod/today_apod_bloc.dart';
import 'package:tdd_clean_arch/presentation/screens/core/apod_view_page.dart';

class ApodTodayScreen extends StatefulWidget {

  const ApodTodayScreen({ super.key });

  @override
  State<ApodTodayScreen> createState() => _ApodTodayScreenState();
}

class _ApodTodayScreenState extends State<ApodTodayScreen> {
  late TodayApodBloc _bloc;

  @override
  void initState() {
    _bloc = getIt<TodayApodBloc>();
    _bloc.input.add(FetchApodTodayEvent());
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
       return StreamBuilder<TodayApodState>(
        stream: _bloc.stream, 
        builder: (context, snapshot) {
          Widget? body;
          TodayApodState? state = snapshot.data;
          if(state is LoadingTodayApodState) {
            body = const Center(child: CircularProgressIndicator());
          }
          if(state is ErrorTodayApodState) {
            body = Center(child: Text(state.msg));
          }
          if(state is SucessTodayApodState) {
            final apod = state.apod;
            return ApodViewPage(apod: apod);
          }
          return Scaffold(
            body: body ?? Container(),
          );
        }
      );
  }
}