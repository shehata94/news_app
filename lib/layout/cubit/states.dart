abstract class NewsCubitStates {}

class NewsCubitInitState extends NewsCubitStates{}

class BottomNavBarState extends NewsCubitStates{}

class BusinessGetDataSuccessState extends NewsCubitStates{}

class BusinessGetDataLoadingState extends NewsCubitStates{}

class BusinessGetDataErrorState extends NewsCubitStates
{
  final String error;

  BusinessGetDataErrorState(this.error);
}

class SportsGetDataLoadingState extends NewsCubitStates{}

class SportsGetDataSuccessState extends NewsCubitStates{}

class SportsGetDataErrorState extends NewsCubitStates
{
  final String error;

  SportsGetDataErrorState(this.error);
}

class ScienceGetDataSuccessState extends NewsCubitStates{}

class ScienceGetDataLoadingState extends NewsCubitStates{}

class ScienceGetDataErrorState extends NewsCubitStates
{
  final String error;

  ScienceGetDataErrorState(this.error);
}

class AppThemeState extends NewsCubitStates{}

class SearchGetDataSuccessState extends NewsCubitStates{}

class SearchGetDataLoadingState extends NewsCubitStates{}

class SearchGetDataErrorState extends NewsCubitStates
{
  final String error;

  SearchGetDataErrorState(this.error);
}

class AppThemeMode extends NewsCubitStates{}
