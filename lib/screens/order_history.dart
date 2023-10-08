import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../data/cart_provider.dart';
import '../data/db_helper.dart';
import 'package:provider/provider.dart';

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
    String displayId = order.id.split(':').first;
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(displayId),
        subtitle: Text(
          'IDR ${order.amount.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.')}',
        ),
        trailing: Text(order.dateTime),
      ),
    );
  }
}

class _OrderHistoryState extends State<OrderHistory> with SingleTickerProviderStateMixin {
  DBHelper? dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).loadOrders();
    context.read<CartProvider>().getData();
  }

  int selectedBottomNavIndex = 4;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textStyle = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.surfaceTint,
          title: Center(
            child: Text(
              'Order History',
              style: textStyle.displayMedium!.copyWith(
                color: colorScheme.onInverseSurface,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Clear Order History'),
                      content: const Text('Are you sure you want to clear all orders?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final cartProvider = Provider.of<CartProvider>(context, listen: false);
                            await dbHelper!.clearOrders();
                            cartProvider.loadOrders();
                            Navigator.pop(context);
                          },
                          child: const Text('Clear'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: Consumer<CartProvider>(
          builder: (ctx, orderData, child) => orderData.orders.isEmpty
              ? Center(
                  child: Text(
                  "You have not ordered anything yet",
                  style: textStyle.labelMedium,
                ))
              : ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
                ),
        ));
  }
}
