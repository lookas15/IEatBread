import 'package:flutter/material.dart';
import '../widgets/menu_card.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // Perubahan di sini

  final List<String> categories = ['Bread', 'Pastry', 'Drinks'];
  int selectedTabIndex = 0;
  int selectedBottomNavIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: categories.length);
    _tabController.addListener(_handleTabSelection); // Tambahkan listener
  }

  // Tambahkan metode untuk menghandle perubahan tab
  void _handleTabSelection() {
    setState(() {
      selectedTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose TabController saat widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          title: Center(
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: const Color.fromARGB(255, 245, 89, 81),
              isScrollable: true,
              unselectedLabelColor: const Color.fromARGB(255, 137, 137, 137),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              tabs: categories.map((category) {
                return Tab(
                  child: Text(
                    category,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        // Items for each categories
        SliverFillRemaining(
          child: TabBarView(
            controller: _tabController,
            children: categories.map((category) {
              return MenuCard(
                category: category,
                quantityNotifier: ValueNotifier<int>(
                    0), // Tambahkan ValueNotifier dengan nilai awal 0
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
