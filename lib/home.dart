import 'package:flutter/material.dart';
import 'package:product_listtt/menupage.dart';
import 'package:product_listtt/Widgets/navbar_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<String> categories = ['Deals', 'Bread', 'Pastry', 'Drinks'];
  int selectedTabIndex = 0; // Tab awal yang dipilih

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
            // Navigator.push(context, MaterialPageRoute(builder: (context) => isiNamaPage()));
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
          SliverToBoxAdapter(
            child: Center(
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
                return MenuPage(category: category);
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
