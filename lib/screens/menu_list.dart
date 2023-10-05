import 'package:flutter/material.dart';
import 'package:product_listtt/widgets/navbar_widget.dart';
import 'package:product_listtt/widgets/menu_card.dart';

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
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Color.fromARGB(255, 240, 240, 240),
            title: Center(
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: const Color.fromARGB(255, 245, 89, 81),
                isScrollable: true,
                unselectedLabelColor: Color.fromARGB(255, 137, 137, 137),
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                tabs: categories.map((category) {
                  return Tab(
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
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
