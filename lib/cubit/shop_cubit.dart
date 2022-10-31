import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/network/end_point.dart';
import 'package:newsapp/network/remote/dioHelper2.dart';

class ShopCubit extends Cubit<AppStates> {
  ShopCubit() : super(InatialAppState());

  static ShopCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingPostLoginScreen());
    DioHelper2.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      emit(SuccsessPostLoginScreen());
    }).catchError((error) {
      emit(ErrorPostLoginScreen(error.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(ShopAppChangePasswordState());
  }
}
