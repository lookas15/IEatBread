import 'package:flutter/material.dart';
import 'package:flutter_application/widget/menu_card.dart';
import 'package:flutter_application/widget/navbar_widget.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<String> categories = ['Deals', 'Bread', 'Pastry', 'Drinks'];
  int selectedTabIndex = 0; // Tab awal yang dipilih
  int selectedBottomNavIndex = 1; // Indeks ikon bawah yang dipilih

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: categories.length, initialIndex: 0);
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
        leading: IconButton(
          icon: const Icon(
            Icons.breakfast_dining_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MenuList()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
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
                onTap: (index) {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                return MenuCard(category: category);
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
