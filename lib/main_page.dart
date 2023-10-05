import 'package:flutter/material.dart';

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
        page = Placeholder();
        break;
      case 2:
        page = Placeholder();
        break;
      case 3:
        page = Placeholder();
        break;
      case 4:
        page = Placeholder();
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
                    items: [
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
              SafeArea(
                child: NavigationRail(
                  // If width >= 600px, then show the text for all navigation items.
                  extended: constraints.maxWidth >= 600,
                  indicatorColor: colorScheme.surfaceVariant,
                  destinations: [
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
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
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
