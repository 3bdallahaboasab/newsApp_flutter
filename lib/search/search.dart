import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
// import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

import '../components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    labelText: "Search ",

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(25)),
                    // icon: Icon(Icons.search),
                    prefixIcon: Icon(Icons.search, color: Colors.deepOrange),
                  ),
                  controller: searchController,
                  onChanged: (value) {
                    AppCubit.get(context).getSearch(value);
                  },
                  keyboardType: TextInputType.text,
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'Search Must Not Be Empty ';
                    }
                    return null;
                  },
                ),
              ),
              ConditionalBuilder(
                condition: list.length > 0,
                builder: (context) {
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int i) {
                          return buildArticalItem(
                              AppCubit.get(context).search[i], context);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return myDivider();
                        },
                        itemCount: AppCubit.get(context).search.length),
                  );
                },
                fallback: (context) => Center(
                    child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                )),
              )
              //
              // Expanded(
              // child: ListView.separated(
              //     physics: BouncingScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return buildArticalItem(
              //           searchController.search[index], context);
              //     },
              //     separatorBuilder: (context, index) => myDivider(),
              //     itemCount: newsLayoutController.search.length),
              // ),
            ],
          ),
        );
      },
    );
  }
}
