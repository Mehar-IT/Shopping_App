import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

class CartModel extends ChangeNotifier {
  List<Products>? _selectedproducts = [];

  num? get price => _selectedproducts!
      .fold(0, (previousValue, element) => previousValue! + element.price);

  List<Products> get selectedProducts => _selectedproducts!;

  void add(var value) {
    _selectedproducts!.add(value);

    notifyListeners();
  }

  void delete(var value) {
    _selectedproducts!.remove(value);

    notifyListeners();
  }
}
