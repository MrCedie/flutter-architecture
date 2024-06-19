class CounterViewModel {
  late int _counter;

  CounterViewModel() {
    _counter = 0;
  }

  int get count => _counter;

  void increment() {
    _counter++;
  }

  void decrement() {
    _counter--;
  }

  void helloWorld() {
    print('Hello worlds');
  }
}
