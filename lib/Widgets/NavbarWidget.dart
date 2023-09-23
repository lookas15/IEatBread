import 'package:flutter/material.dart';

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
            buildNavbarIcon(Icons.breakfast_dining_outlined, 1),
            buildNavbarIcon(Icons.discount_outlined, 2),
            buildNavbarIcon(Icons.shopping_basket_outlined, 3),
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
      },
    );
  }
}
