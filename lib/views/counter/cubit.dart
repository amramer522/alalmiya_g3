import 'package:alalmiya_g3/views/counter/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterStates());
  int count = 0;

  void plus() {
    count++;
    emit(CounterUpdateState());
  }

  void minus() {
    count--;
    emit(CounterUpdateState());
  }
}
