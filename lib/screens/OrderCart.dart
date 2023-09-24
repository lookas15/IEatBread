import 'package:flutter/material.dart';
import 'package:product_listtt/Widgets/NavbarWidget.dart';
import 'package:product_listtt/screens/MenuList.dart';

class OrderCart extends StatefulWidget {
  const OrderCart({super.key});

  @override
  State<OrderCart> createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> with SingleTickerProviderStateMixin {

  int selectedBottomNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: Text(
          'iEatBread',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 245, 89, 81),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, // Ganti ikon ke Icons.arrow_back
            color: Colors.white,
          ),
          onPressed: () {
            // Kembali ke layar sebelumnya
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MenuList()),
            );
          },
        ),
      ),
      bottomNavigationBar: NavbarWidget(
        selectedIndex: selectedBottomNavIndex,
        onTabChanged: (index) {
          setState(() {
            selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}
