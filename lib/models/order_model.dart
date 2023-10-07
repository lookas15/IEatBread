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

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      amount: map['amount'],
      dateTime: map['dateTime'],
      products: [], 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'dateTime': dateTime,
    };
  }
}