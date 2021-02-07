import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int counter = 0;
  final counterController = BehaviorSubject<int>();
  final counterActionController = BehaviorSubject<void>();

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
