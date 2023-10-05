import 'package:flutter/material.dart';
import 'package:product_listtt/data/CartProvider.dart';
import 'package:product_listtt/screens/OrderCart.dart';
import 'package:product_listtt/screens/MenuList.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class NavbarWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const NavbarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  _NavbarWidgetState createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.transparent,
      elevation: 8,
      child: Container(
        height: 50.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildNavbarIcon(Icons.home_outlined, 0),
            buildNavbarIcon(Icons.menu_book_outlined, 1),
            buildNavbarIcon(Icons.percent_outlined, 2),
            buildShoppingBasketIcon(context, 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavbarIcon(IconData iconData, int index) {
    final isSelected = widget.selectedIndex == index;
    final color = isSelected ? Color.fromARGB(255, 245, 89, 81) : Colors.black;

    return IconButton(
      icon: Icon(
        iconData,
        color: color,
      ),
      onPressed: () {
        widget.onTabChanged(index);
        switch (index) {
          case 0:
            Navigator.of(context).popUntil((route) => route.isFirst);
            break;
          case 1:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MenuList()),
            );
            break;
          case 2:
            break;
          case 3:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => OrderCart()),
            );
            break;
        }
      },
    );
  }

  Widget buildShoppingBasketIcon(BuildContext context, int index) {
    final isSelected = widget.selectedIndex == index;
    final colors = isSelected ? Color.fromARGB(255, 245, 89, 81) : Colors.black;

    return badges.Badge(
      badgeContent: Consumer<CartProvider>(
        builder: (context, value, child) {
          return Text(
            value.getCounter().toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
      position: badges.BadgePosition.topEnd(top: -5, end: -5),
      child: IconButton(
        icon: Icon(Icons.shopping_cart_outlined, color: colors),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => OrderCart()),
          );
        },
      ),
    );
  }
}
