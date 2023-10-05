import 'package:flutter/material.dart';
import 'package:product_listtt/data/db_helper.dart';
import 'package:product_listtt/data/cart_provider.dart';
import 'package:product_listtt/data/color.dart';
import 'package:product_listtt/models/cart_model.dart';
import 'package:product_listtt/widgets/button.dart';
import 'package:provider/provider.dart';

class MenuDetails extends StatefulWidget {
  final int id;
  final String productId;
  final String productName;
  final int initialPrice;
  final int productPrice;
  final String category;
  final String imageUrl;
  final String details;
  final ValueNotifier<int> quantityNotifier;

  const MenuDetails({
    Key? key,
    required this.id,
    required this.productId,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.category,
    required this.imageUrl,
    required this.details,
    required this.quantityNotifier,
  }) : super(key: key);

  @override
  State<MenuDetails> createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  DBHelper dbHelper = DBHelper();

  // Menambah variabel quantityCount
  int quantityCount = 1;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    // Deklarasi fungsi decrementQuantity untuk mengurangi quantityCount
    void decrementQuantity() {
      if (quantityCount > 1) {
        setState(() {
          quantityCount--;
        });
      }
    }

    // Deklarasi fungsi incrementQuantity untuk menambah quantityCount
    void incrementQuantity() {
      setState(() {
        quantityCount++;
      });
    }

    // Fungsi untuk menambah produk ke keranjang
    void addToCart() {
      dbHelper
          .insertOrUpdate(
        Cart(
          id: widget.id,
          productId: widget.id.toString(),
          productName: widget.productName,
          initialPrice: widget.initialPrice * quantityCount,
          productPrice: widget.productPrice,
          quantity: ValueNotifier<int>(quantityCount),
          category: widget.category,
          image: widget.imageUrl,
        ),
      )
          .then((value) {
        cart.addTotalPrice(widget.initialPrice.toDouble());
        cart.addCounter(quantityCount);
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // listview of details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: [
                  // category
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      widget.category,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 42.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),

                  const SizedBox(
                    height: 15.0,
                  ),
                  // image
                  Hero(
                    tag: widget.imageUrl,
                    child: Image.asset(
                      widget.imageUrl,
                      height: 220,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // food name
                  Text(
                    widget.productName,
                    style: TextStyle(
                        color: primaryColor,
                        fontFamily: 'Poppins',
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),

                  // food price
                  Text(
                    'IDR ${widget.productPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.')}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // description
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),

                  Text(
                    widget.details,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          // price + quantity + add to cart button
          Container(
            padding: const EdgeInsets.all(25.0),
            color: primaryColor,
            child: Column(
              children: [
                // quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // item quantity text
                    const Text(
                      "Item Quantity",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),

                    // plus and minus button
                    Row(
                      children: [
                        // minus button
                        Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(109, 140, 94, 91),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                                onPressed: decrementQuantity,
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ))),

                        // quantity
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),

                        // plus button
                        Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(109, 140, 94, 91),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                                onPressed: incrementQuantity,
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ))),
                      ],
                    )
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                // add to cart
                MyButton(
                  text: "Add To Cart",
                  onTap: () {
                    addToCart();
                    if (quantityCount > 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          content: const Text(
                            'Menu successfully added to cart.',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
