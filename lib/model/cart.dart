import 'package:flutter/material.dart';
import 'package:my_app/model/glass.dart';

class Cart with ChangeNotifier {
  List<Glass> items = [];
  double _price = 0;

  void add(Glass item) {
    items.add(item);
    _price += item.price;
    notifyListeners();
  }

void remove(Glass item) {
    items.remove(item);
    _price -= item.price;
    notifyListeners();
  }
  int get count {
    return items.length;
  }

  double get totalPrice {
    return _price;
  }

  List<Glass> get basketItem {
    return items;
  }
}
