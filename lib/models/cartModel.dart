import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List _selectedproducts = [];

  num get price => _selectedproducts.fold(
      0, (previousValue, element) => previousValue + element.price);

  List get selectedProducts => _selectedproducts;

  void add(var value) {
    _selectedproducts.add(value);

    notifyListeners();
  }

  void delete(var value) {
    _selectedproducts.remove(value);

    notifyListeners();
  }
}
