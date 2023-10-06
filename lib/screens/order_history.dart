import 'package:flutter/material.dart';
import 'package:product_listtt/models/cart_model.dart';
import 'package:provider/provider.dart';
import '../data/cart_provider.dart';
import '../data/db_helper.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(order.id),
      subtitle: Text('Rp. ${order.amount.toStringAsFixed(2)}'), // Display total price
      trailing: Text('${order.dateTime}'),
    );
  }
}
class _OrderHistoryState extends State<OrderHistory>
    with SingleTickerProviderStateMixin {
  DBHelper? dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getData();
  }

  int selectedBottomNavIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (ctx, orderData, child) => orderData.orders.isEmpty
          ? Center(child: Text("You have not ordered anything yet"))
          : ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
    );
  }
}

