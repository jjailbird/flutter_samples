import 'dart:async';
import 'dart:ffi';
import 'package:bloc/bloc.dart';


enum CounterEvent { increment, decrement }


class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
   on<CounterEvent>(_counterEvent); 
  }

  FutureOr<void> _counterEvent(CounterEvent event, Emitter<int> emit) {
    switch (event) {
      case CounterEvent.increment:
        emit(state + 1);
        break;
      case CounterEvent.decrement:
        emit(state - 1);
        break;    
    }
  }
}


Future<void> main(List<String> args) async {
  final bloc = CounterBloc();
  print("bloc.state: ${bloc.state}");

  final subs = bloc.stream.listen((i){
    print("bloc.state: $i");
  });

  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.increment);

}

