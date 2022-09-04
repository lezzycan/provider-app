import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier{

  int value  = 0;

  void increment(){
    value++;
    notifyListeners();
  }
}