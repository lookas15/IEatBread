import 'package:flutter/material.dart';
import 'package:product_listtt/menupage.dart';
import 'package:product_listtt/widget/navbar_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: Text('iEatBread',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
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
        ]
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 18.0),
        children: [
          // const Text ('Menu',
          //   style: TextStyle(
          //     fontSize: 42.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: const Color.fromARGB(255, 245, 89, 81),
            isScrollable: true,
            // labelPadding: const EdgeInsets.symmetric(horizontal: 50),
            unselectedLabelColor: Color.fromARGB(255, 137, 137, 137),
            padding: EdgeInsets.fromLTRB(25,5,5,5),
            tabs: const [
              Tab(
                child: Text('Deals',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Tab(
                child: Text('Bread',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                )
              ),
              Tab(
                child: Text('Pastry',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Tab(
                child: Text('Drinks',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: const [
                MenuPage(),
                MenuPage(),
                MenuPage(),
                MenuPage(),
              ],
            ),
          ),
          
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Color.fromARGB(255, 245, 89, 81),
      //   child: const Icon(Icons.fastfood),
      // ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}