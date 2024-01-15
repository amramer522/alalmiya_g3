import 'model.dart';

class FavsStates {}

class GetFavsLoadingState extends FavsStates {}
class GetFavsSuccessState extends FavsStates {
  final List<ProductModel> list;
  GetFavsSuccessState({required this.list});
}
class GetFavsFailedState extends FavsStates {}
