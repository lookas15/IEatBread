import '../models/cart_model.dart';

class Order {
  final String id;
  final double amount;
  final List<Cart> products;
  final String dateTime; 

  Order({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime, 
  });

  Order.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        amount = map['amount'],
        dateTime = map['dateTime'],
        products = (map['products'] as List)
            .map((item) => Cart.fromMap(item))
            .toList();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'dateTime': dateTime,
      'products': products.map((item) => item.toMap()).toList(),
    };
  }
}
