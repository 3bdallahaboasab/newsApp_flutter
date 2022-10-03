import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/cubit2.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/network/remote/dioHelper.dart';
import 'package:newsapp/search/search.dart';

import 'cubit/bloc_opserver.dart';
import 'layout/home_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => AppCubit()
            ..getBusnissData()
            ..getSportsData()
            ..getScienceData()),
        ),
        BlocProvider(create: (context) => DarkCubit())
      ],
      child: BlocConsumer<DarkCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: DarkCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData(
                primaryColorLight: Colors.deepOrange,
                primaryColor: Colors.deepOrange,
                // focusColor: Colors.deepOrange,
                iconTheme: IconThemeData(color: Colors.black),
                textTheme: TextTheme(
                  bodyText1: TextStyle(fontSize: 18, color: Colors.black),
                  bodyText2: TextStyle(fontSize: 10, color: Colors.black),
                ),
                bottomNavigationBarTheme:
                    BottomNavigationBarThemeData(elevation: 0),
                appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark,
                        statusBarBrightness: Brightness.dark),
                    backgroundColor: Colors.white,
                    elevation: 0),
                scaffoldBackgroundColor: Colors.white),
            darkTheme: ThemeData(
              iconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme(
                bodyText1: TextStyle(fontSize: 18, color: Colors.white),
                bodyText2: TextStyle(fontSize: 10, color: Colors.white),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.black),
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.grey,
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              scaffoldBackgroundColor: Colors.grey,
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
