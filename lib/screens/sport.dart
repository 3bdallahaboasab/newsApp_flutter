import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  var list = AppCubit.get(context).buisness;
    return BlocConsumer<AppCubit, AppStates>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).sport.length > 0,
          builder: (context) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int i) {
                return buildArticalItem(
                    AppCubit.get(context).sport[i], context);
              },
              separatorBuilder: (BuildContext context, int index) {
                return myDivider();
              },
              itemCount: AppCubit.get(context).buisness.length,
            );
          },
          fallback: (context) => Center(
              child: CircularProgressIndicator(
            color: Colors.deepOrange,
          )),
        );
      },
    );
  }
}
