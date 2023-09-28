import 'package:flutter/material.dart';
import 'package:flutter_application/data/menu.dart';

class Shop extends ChangeNotifier{
  // customer cart
List<Menu> _cart = [];

// getter methods
List<Menu> get cart => _cart;

// add to cart
void addToCart(Menu menuItem, int quantity) {
  for (int i = 0; i < quantity; i++) {
    _cart.add(menuItem);
  }
  notifyListeners();
}

// remove from cart
void removeFromCart(Menu menuItem) {
  _cart.remove(menuItem);
  notifyListeners();
  }
}