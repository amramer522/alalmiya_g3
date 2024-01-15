class HomeStates {}

class GetHomeLoadingState extends HomeStates {}

class GetHomeFailedState extends HomeStates {}

class GetHomeSuccessState extends HomeStates {
  final List<String> list;

  GetHomeSuccessState({required this.list});
}
