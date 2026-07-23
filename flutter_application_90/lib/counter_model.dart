import 'package:flutter/cupertino.dart';

class CounterModel with ChangeNotifier
{
  int _counter = 0;

  int getCounter() => _counter;

  int setCounter(int counter) => _counter = counter;

  void incrementCounter()
  {
    _counter++;
    notifyListeners();
  }
  void decrementCounter()
  {
    _counter--;
    notifyListeners();
  }
}