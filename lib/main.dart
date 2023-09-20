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
        Item("Anpan", 'images/anpan.jpg', 10000, 'A Japanese sweet roll most commonly filled with red bean paste.'),
        Item("Bagel", 'images/bagel.jpeg', 11000, 'A bread roll originating in the Jewish communities of Poland.'),
        Item("Baguette", 'images/baguette.jpg', 12000, 'A long, thin type of bread of French origin that is commonly made from basic lean dough.'),
        Item("Banana Bread", 'images/bananaBread.jpeg', 13000, 'A type of sweet bread made from mashed bananas. It is often a moist and sweet quick bread.'),
        Item("Boule", 'images/boule.jpeg', 14000, 'A traditional shape of French bread resembling a squashed ball.'),
        Item("Breadstick", 'images/breadstick.jpg', 15000, 'Pencil-sized sticks of crisp, dry baked bread that originated in Piedmont, a region of Italy.'),
        Item("Brioche", 'images/brioche.jpeg', 16000, 'A bread of French origin whose high egg and butter content gives it a rich and tender crumb.'),
        Item("Challah", 'images/challah.jpg', 17000, 'A special bread of Ashkenazi Jewish origin, usually braided and typically eaten on ceremonial occasions.'),
        Item("Croissant", 'images/croissant.jpeg', 18000, 'A buttery, flaky, viennoiserie pastry inspired by the shape of the Austrian kipferl'),
        Item("Faluche", 'images/faluche.jpeg', 19000, 'A traditional bread in the Nord-Pas-de-Calais region of northern France and the Tournai region of southern Belgium.'),
        Item("Ficelle", 'images/ficelle.jpg', 20000, 'A type of French bread loaf, made with yeast and similar to a baguette but much thinner.'),
        Item("Fougasse", 'images/fougasse.jpeg', 21000, 'A type of bread typically associated with Provence but found (with variations) in other regions.'),
        Item("Pain brié", 'images/painBrie.jpeg', 22000, 'A traditional Normandy bread. Its name comes from the pounding of the dough "brie", meaning "to pound".'),
        Item("Pain de Campagne", 'images/painDeCampagne.jpeg', 23000, 'A large round loaf ("miche") made from either natural leavening or baker\'s yeast.'),
        Item("Pain de Mie", 'images/painDeMie.jpeg', 24000, 'A white or brown bread with a thin, soft crust. It is mostly sold sliced and packaged in France.')
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
                                                        child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(20), // Image Border
                                                            child: Container(
                                                                padding: EdgeInsets.all(10),
                                                                color: Colors.grey[50],
                                                                child: Text('${item.desc}', textAlign: TextAlign.left),
                                                            ), // Container
                                                        ), // ClipRRect
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
