import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/cubit2.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/network/remote/dioHelper.dart';
import 'package:newsapp/network/remote/dioHelper2.dart';

import 'package:newsapp/shop_App/onBoarding/onBoarding.dart';
import 'package:newsapp/style/theme.dart';

import 'cubit/bloc_opserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  DioHelper2.init();
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
            theme: lightTheme,
            darkTheme: darkTheme,
            home: OnBoardScreen(),
          );
        },
      ),
    );
  }
}
