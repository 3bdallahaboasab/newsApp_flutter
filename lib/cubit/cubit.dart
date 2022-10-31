import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/screens/business.dart';
import 'package:newsapp/screens/science.dart';

import 'package:newsapp/screens/sport.dart';

import '../network/remote/dioHelper.dart';
import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InatialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<BottomNavyBarItem> listItems = [
    BottomNavyBarItem(
      icon: Icon(Icons.business),
      title: Text('Business'),
      activeColor: Colors.red,
    ),
    BottomNavyBarItem(
      icon: Icon(Icons.sports),
      title: Text('Sports'),
      activeColor: Colors.red,
    ),
    BottomNavyBarItem(
      icon: Icon(Icons.science),
      title: Text('Science'),
      activeColor: Colors.red,
    ),
  ];

  void bottomnav(int index) {
    currentindex = index;
    emit(BottomNavBarState());
  }

  List screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    // SettingsScreen(),
  ];

  List<dynamic> buisness = [];

  void getBusnissData() {
    emit(LoadingGetBuisnessDataState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '1a5cd3c7fb394498995e42337704246d'
    }).then((value) {
      buisness = value.data['articles'];
      print(buisness[10]['publishedAt']);
      emit(GetDataSuccsessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDataErrorState());
    });
  }

  List<dynamic> sport = [];

  void getSportsData() {
    emit(LoadingGetBuisnessDataState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sport',
      'apiKey': '1a5cd3c7fb394498995e42337704246d'
    }).then((value) {
      sport = value.data['articles'];
      print(sport[10]['publishedAt']);
      emit(GetDataSportSuccsessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDataSportErrorState());
    });
  }

  List<dynamic> science = [];

  void getScienceData() {
    emit(LoadingGetScienceDataState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '1a5cd3c7fb394498995e42337704246d'
    }).then((value) {
      science = value.data['articles'];
      print(science[10]['publishedAt']);
      emit(GetDataScienceSuccsessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDataScienceErrorState());
    });
  }

  List<dynamic> search = [];

  void getSearch(value) {
    emit(LoadingGetSearchDataState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '1a5cd3c7fb394498995e42337704246d'
    }).then((value) {
      search = value.data['articles'];
      search.add(value.data);

      emit(GetDataSearchSuccState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDataSearchErrorState());
    });
  }
}
