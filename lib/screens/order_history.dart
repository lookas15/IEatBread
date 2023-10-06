import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/cart_provider.dart';
import '../data/db_helper.dart';
import 'menu_list.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
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
      builder: (ctx, orderData, child) => ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
    );
  }
}
