import 'package:flutter/material.dart';
import 'package:flutter_application/pages/HomePage.dart';
import 'pages/CartScreen.dart';
import 'Item.dart';


void main() => runApp(MaterialApp(
    home: ItemList(),
));

class ItemList extends StatefulWidget {
    @override
    _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
    List<Item> items = [
        Item("Anpan", 'images/anpan.jpg', 10000),
        Item("Bagel", 'images/bagel.jpeg', 11000),
        Item("Baguette", 'images/baguette.jpg', 12000),
        Item("Banana Bread", 'images/bananaBread.jpeg', 13000),
        Item("Boule", 'images/boule.jpeg', 14000),
        Item("Breadstick", 'images/breadstick.jpg', 15000),
        Item("Brioche", 'images/brioche.jpeg', 16000),
        Item("Challah", 'images/challah.jpg', 17000),
        Item("Croissant", 'images/croissant.jpeg', 18000),
        Item("Faluche", 'images/faluche.jpeg', 19000),
        Item("Ficelle", 'images/ficelle.jpg', 20000),
        Item("Fougasse", 'images/fougasse.jpeg', 21000),
        Item("Pain Brie", 'images/painBrie.jpeg', 22000),
        Item("Pain de Campagne", 'images/painDeCampagne.jpeg', 23000),
        Item("Pain de Mie", 'images/painDeMie.jpeg', 24000)
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.purple[50],
                title: Text('IEatBread',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ), // TextStyle
                ), // Text
            ), // AppBar

            body: SingleChildScrollView(
                child: Column(
                    children: items.map((item) {
                        return Container(
                            padding: EdgeInsets.all(10.0),
                            height: 150,
                            child: Row(
                                children: <Widget>[
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Image Border
                                        child: SizedBox.fromSize(
                                            size: Size.fromRadius(60), // Image Radius
                                            child: Image.asset('${item.path}', fit: BoxFit.cover),
                                        ),
                                    ),
                                    SizedBox(width: 20), // Basically empty div for spacing

                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                    Text('${item.name}', 
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.grey[900],
                                                            fontSize: 15,
                                                        ),
                                                    ),
                                                    Text('Rp ${item.price}'),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text('Put description here', textAlign: TextAlign.center),
                                                    ), // Expanded
                                                ], // Column
                                            ),
                                        ), // Container
                                    ), // Expanded
                                ],
                            ), // Row
                        ); // Container
                    }).toList(), // Map to list
                ), // Column
            ), // SingleChildScrollView
        ); // Scaffold
    }
}

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IEatBread",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFFFFFF),
      ),
      routes: {
        // "/": (context) => HomePage(),
        // "/": (context) => CartScreen(),
         "/": (context) => CartScreen(),
      },
    );
  }
}
*/
