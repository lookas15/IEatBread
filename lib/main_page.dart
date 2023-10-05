import 'package:flutter/material.dart';
import 'screens/menu_list.dart';
import 'screens/deals.dart';
import 'screens/order_cart.dart';
import 'screens/order_history.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    // Switch case to change between pages
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Placeholder();
        break;
      case 1:
        page = MenuList();
        break;
      case 2:
        page = Deals();
        break;
      case 3:
        page = OrderCart();
        break;
      case 4:
        page = OrderHistory();
        break;
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }

    // Style the page area and add animations
    var pageArea = ColoredBox(
        color: colorScheme.surfaceVariant,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: page,
        ));

    return Scaffold(body: LayoutBuilder(
      builder: ((context, constraints) {
        // Use constraints to check device witdh
        if (constraints.maxWidth < 450) {
          // If device width < 450, display BottomNavigationBar
          return Column(
            children: [
              Expanded(child: pageArea),
              SafeArea(
                child: BottomNavigationBar(
                    unselectedItemColor: colorScheme.outlineVariant,
                    selectedItemColor: colorScheme.primary,
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.menu_book_outlined), label: 'Menu'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.percent), label: 'Deals'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_cart_outlined),
                          label: 'Cart'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.receipt_long), label: 'Orders'),
                    ]),
              )
            ],
          );
        } else {
          // Larger sidebar for navigation on bigger screen
          return Row(
            children: [
              // SafeArea prevents the navbar from being obscured by status bar or hardware notch
              SafeArea(
                // NavigationRail is basically a side navbar
                child: NavigationRail(
                  // If width >= 600px, then show the text for all navigation items.
                  extended: constraints.maxWidth >= 1200,
                  indicatorColor: colorScheme.surfaceVariant,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                  destinations: const [
                    NavigationRailDestination(
                        icon: Icon(Icons.home_outlined), label: Text('Home')),
                    NavigationRailDestination(
                        icon: Icon(Icons.menu_book_outlined),
                        label: Text('Menu')),
                    NavigationRailDestination(
                        icon: Icon(Icons.percent), label: Text('Deals')),
                    NavigationRailDestination(
                        icon: Icon(Icons.shopping_cart_outlined),
                        label: Text('Cart')),
                    NavigationRailDestination(
                        icon: Icon(Icons.receipt_long), label: Text('Orders'))
                  ],
                ),
              ),
              Expanded(child: pageArea),
            ],
          );
        }
      }),
    ));
  }
}
