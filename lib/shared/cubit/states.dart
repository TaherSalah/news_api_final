abstract class NewsStates {}

class InitialNewsState extends NewsStates{}

class BottomNavBarNewsState extends NewsStates{}

class GetBusinessDataLoadingState extends NewsStates{}
class GetBusinessDataSuccessState extends NewsStates{}
class GetBusinessDataErrorState extends NewsStates{
  final String error;
  GetBusinessDataErrorState(this.error);
}
class GetScienceDataLoadingState extends NewsStates{}
class GetScienceDataSuccessState extends NewsStates{}
class GetScienceDataErrorState extends NewsStates{
  final String error;
  GetScienceDataErrorState(this.error);
}
class GetSportsDataLoadingState extends NewsStates{}
class GetSportsDataSuccessState extends NewsStates{}
class GetSportsDataErrorState extends NewsStates{
  final String error;
  GetSportsDataErrorState(this.error);
}
class GetHealthDataLoadingState extends NewsStates{}
class GetHealthDataSuccessState extends NewsStates{}
class GetHealthDataErrorState extends NewsStates{
  final String error;
  GetHealthDataErrorState(this.error);
}
class GetTechnologyDataLoadingState extends NewsStates{}
class GetTechnologyDataSuccessState extends NewsStates{}
class GetTechnologyDataErrorState extends NewsStates{
  final String error;
  GetTechnologyDataErrorState(this.error);
}
class ChangeModeState extends NewsStates{}
class GetSearchDataLoadingState extends NewsStates{}
class GetSearchDataSuccessState extends NewsStates{}
class GetSearchDataErrorState extends NewsStates{
  final String error;
  GetSearchDataErrorState(this.error);
}
