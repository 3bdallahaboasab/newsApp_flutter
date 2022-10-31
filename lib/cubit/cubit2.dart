import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';

class DarkCubit extends Cubit<AppStates> {
  DarkCubit() : super(InatialAppState());

  static DarkCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void darkMode() {
    isDark = !isDark;
    emit(DarkModeState());
  }
}
