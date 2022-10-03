import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit2.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/network/remote/dioHelper.dart';
import 'package:newsapp/search/search.dart';

import '../components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: ((context, state) {}),
      builder: ((context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  navigatTo(context, SearchScreen());
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.brightness_4_rounded,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  DarkCubit.get(context).darkMode();
                },
              ),
            ],
            title: Text(
              "JNews App",
              style: TextStyle(color: Colors.deepOrange),
            ),
            centerTitle: true,
          ),
          body:
              AppCubit.get(context).screens[AppCubit.get(context).currentindex],
          bottomNavigationBar: BottomNavyBar(
            // backgroundColor: Colors.green,
            selectedIndex: AppCubit.get(context).currentindex,
            items: AppCubit.get(context).listItems,
            onItemSelected: (int index) {
              AppCubit.get(context).bottomnav(index);
            },
            animationDuration: Duration(milliseconds: 300),
          ),
        );
      }),
    );
  }
}
// https://newsapi.org/
// v2/top-headlines?
// country=us&category=business&apiKey=7afa4284413348caa946cf4a421b0217