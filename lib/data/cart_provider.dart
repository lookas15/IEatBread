import 'package:flutter_application/data/DBHelper.dart';
import 'package:flutter_application/models/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  DBHelper dbHelper = DBHelper();
  int _counter = 0;
  int _quantity = 1;
  int get counter => _counter;
  int get quantity => _quantity;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  List<Cart> cart = [];

  Future<List<Cart>> getData() async {
    cart = await dbHelper.getCartList();
    notifyListeners();
    return cart;
  }

  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_items', _counter);
    prefs.setInt('item_quantity', _quantity);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_items') ?? 0;
    _quantity = prefs.getInt('item_quantity') ?? 1;
    _totalPrice = prefs.getDouble('total_price') ?? 0;
  }

  void addCounter() {
    _counter++;
    _setPrefsItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefsItems();
    return _counter;
  }

  void addQuantity(int id) {
    final index = cart.indexWhere((element) => element.id == id);
    cart[index].quantity!.value = cart[index].quantity!.value + 1;
    dbHelper.updateQuantity(cart[index]);
    addTotalPrice(cart[index].productPrice!.toDouble());
    _counter++;
    _setPrefsItems();
    notifyListeners();
  }

  void deleteQuantity(int id) {
    final index = cart.indexWhere((element) => element.id == id);
    final currentQuantity = cart[index].quantity!.value;
    if (currentQuantity > 1) {
      cart[index].quantity!.value = currentQuantity - 1;
      addTotalPrice(cart[index].productPrice!.toDouble());
      _counter--;
    }
    dbHelper.updateQuantity(cart[index]);
    _setPrefsItems();
    notifyListeners();
  }

  void removeItem(int id) {
  final index = cart.indexWhere((element) => element.id == id);
  if (index != -1) {
    final removedItem = cart[index];
    removeTotalPrice(removedItem.productPrice!.toDouble());
    _setPrefsItems();
    _counter -= removedItem.quantity!.value;
    cart.removeAt(index);
    dbHelper.deleteCartItem(removedItem.id!);
    notifyListeners();
  }
}

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefsItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefsItems();
    notifyListeners();
  }
}