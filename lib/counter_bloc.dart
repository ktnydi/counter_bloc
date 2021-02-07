import 'dart:async';

class CounterBloc {
  int counter = 0;
  final counterController = StreamController<int>();
  final counterActionController = StreamController<void>();

  CounterBloc() {
    counterActionController.stream.listen((_) {
      counter = counter + 1;
      counterController.sink.add(counter);
    });
  }

  void dispose() {
    counterController.close();
    counterActionController.close();
  }
}
