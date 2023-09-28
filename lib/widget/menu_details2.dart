import 'package:flutter/material.dart';
import 'package:flutter_application/data/color.dart';
import 'package:flutter_application/widget/button.dart';

class MenuDetails2 extends StatefulWidget {
  final String assetPath;
  final String price;
  final String name;
  final String details;
  final String category;

  const MenuDetails2(
      {super.key,
      required this.assetPath,
      required this.price,
      required this.name,
      required this.details,
      required this.category,
      });

  @override
  State<MenuDetails2> createState() => _MenuDetails2State();
}

class _MenuDetails2State extends State<MenuDetails2> {
  // quantity
  int quantityCount = 0;

  // decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // add to cart
  void addToCart() {

  }

  @override
  Widget build(BuildContext context) {
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
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 42.0,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15.0,
                  ),
                  // image
                  Hero(
                    tag: widget.assetPath,
                    child: Image.asset(
                      widget.assetPath,
                      height: 220,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // food name
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: primaryColor,
                        fontFamily: 'Poppins',
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),

                  // food price
                  Text(
                    'Rp ${widget.price}',
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

          const SizedBox(height: 20,),

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

                const SizedBox(height: 20,),
                // add to cart
                MyButton(text: "Add To Cart", onTap: addToCart),
              ],
            ),
          )
        ],
      ),
    );
  }
}
