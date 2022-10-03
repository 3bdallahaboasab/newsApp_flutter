// import 'package:conditional_builder/conditional_builder.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/components/components.dart';
import 'package:newsapp/cubit/cubit.dart';

import '../cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = AppCubit.get(context).buisness;
    return BlocConsumer<AppCubit, AppStates>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).buisness.length > 0,
          builder: (context) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int i) {
                return buildArticalItem(
                    AppCubit.get(context).buisness[i], context);
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
