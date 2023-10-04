import 'package:flutter/material.dart';
import 'package:product_listtt/data/DBHelper.dart';
import 'package:product_listtt/data/CartProvider.dart';
import 'package:product_listtt/models/cart_model.dart';
import 'package:product_listtt/models/menu_model.dart' as menu_model;
import 'package:product_listtt/screens/MenuDetails.dart';
import 'package:provider/provider.dart';

class MenuCard extends StatefulWidget {
  final String category;
  const MenuCard({Key? key, required this.category}) : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  DBHelper dbHelper = DBHelper();
  List<menu_model.Menu> menu = menu_model.listMenu;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    void saveData(int index) {
      dbHelper
          .insertOrUpdate(
        Cart(
          id: index,
          productId: menu[index].id.toString(),
          productName: menu[index].name,
          initialPrice: menu[index].price,
          productPrice: menu[index].price,
          quantity: ValueNotifier(1),
          category: menu[index].category,
          image: menu[index].imageUrl,
        ),
      )
          .then((value) {
        cart.addTotalPrice(menu[index].price.toDouble());
        cart.addCounter(1);
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 190.0,
            child: ListView.builder(
              itemCount: menu_model.listMenu.length,
              itemBuilder: (context, index) {
                if (menu_model.listMenu[index].category == widget.category) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return MenuDetails(
                              id: index,
                              productId: menu[index].id.toString(),
                              productName: menu[index].name,
                              initialPrice: menu[index].price,
                              productPrice: menu[index].price,
                              category: menu[index].category,
                              imageUrl: menu[index].imageUrl,
                              details: menu[index].description,
                            );
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3.0,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      menu[index].isFavorite
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Color.fromARGB(
                                                  255, 245, 89, 81),
                                            )
                                          : SizedBox(height: 25.0)
                                    ],
                                  )),
                              Hero(
                                tag: menu[index].imageUrl,
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(menu[index].imageUrl),
                                        fit: BoxFit.contain,
                                      )),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'IDR ${menu[index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.')}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 245, 89, 81),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                menu[index].name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 30, 5, 10),
                                child: Container(
                                  color: Color.fromARGB(255, 231, 231, 231),
                                  height: 0.8,
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    saveData(index);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        content: const Text(
                                          'Menu successfully added to cart.',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF55951),
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  10),
                                        ),
                                        // Padding(padding: EdgeInsets.only(top: 15)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.shopping_basket,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              size: 22,
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              'Add to Cart',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          ),
                        )),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
