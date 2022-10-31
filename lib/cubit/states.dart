abstract class AppStates {}

class InatialAppState extends AppStates {}

class BottomNavBarState extends AppStates {}

class GetDataSuccsessState extends AppStates {}

class GetDataErrorState extends AppStates {}

class LoadingGetBuisnessDataState extends AppStates {}

class GetDataSportSuccsessState extends AppStates {}

class GetDataSportErrorState extends AppStates {}

class LoadingGetSportDataState extends AppStates {}

class GetDataScienceSuccsessState extends AppStates {}

class GetDataScienceErrorState extends AppStates {}

class LoadingGetScienceDataState extends AppStates {}

class DarkModeState extends AppStates {}

class GetDataSearchErrorState extends AppStates {}

class GetDataSearchSuccState extends AppStates {}

// Shop App
class LoadingGetSearchDataState extends AppStates {}

class LoadingPostLoginScreen extends AppStates {}

class SuccsessPostLoginScreen extends AppStates {}

class ErrorPostLoginScreen extends AppStates {
  String error;

  ErrorPostLoginScreen(this.error);
}

class ShopAppChangePasswordState extends AppStates {}
