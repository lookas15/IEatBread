import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_model.dart';
import '../data/db_helper.dart';
import '../data/cart_provider.dart';
import '../data/color.dart';
import '../models/cart_model.dart';
import '../widgets/button.dart';

class MenuDetails extends StatefulWidget {
  final Menu item;

  const MenuDetails({Key? key, required this.item}) : super(key: key);

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
    var colorScheme = Theme.of(context).colorScheme;
    var textStyle = Theme.of(context).textTheme;
    var item = widget.item;

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
          id: item.id,
          productId: item.id.toString(),
          productName: item.name,
          initialPrice: item.price * quantityCount,
          productPrice: item.price,
          quantity: ValueNotifier<int>(quantityCount),
          category: item.category,
          image: item.imageUrl,
        ),
      )
          .then((value) {
        cart.addTotalPrice(item.price.toDouble());
        cart.addCounter(quantityCount);
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorScheme.surface,
        backgroundColor: colorScheme.surfaceTint,
        title: Text(
          'Details',
          style: textStyle.headlineMedium!.copyWith(
            color: colorScheme.surface,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // listview of details
          Expanded(
            child: ItemDetails(item: item),
          ),

          const SizedBox(
            height: 20,
          ),

          // price + quantity + add to cart button
          Container(
            padding: const EdgeInsets.all(25.0),
            color: colorScheme.primary,
            child: Column(
              children: [
                // quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // item quantity text
                    Text("Item Quantity",
                        style: textStyle.labelMedium!.copyWith(
                          color: colorScheme.background,
                        )),

                    // plus and minus button
                    Row(
                      children: [
                        // minus button
                        Container(
                            decoration: BoxDecoration(
                              color: colorScheme.onPrimary,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              color: colorScheme.secondary,
                              icon: const Icon(Icons.remove),
                              onPressed: decrementQuantity,
                            )),

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
                            decoration: BoxDecoration(
                              color: colorScheme.onPrimary,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              color: colorScheme.secondary,
                              icon: const Icon(Icons.add),
                              onPressed: incrementQuantity,
                            )),
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
                          backgroundColor: colorScheme.onPrimary,
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

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
    required this.item,
  });

  final Menu item;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          // category
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              item.category,
              style: textStyle.displayLarge!.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),

          const SizedBox(
            height: 15.0,
          ),
          // image
          Hero(
            tag: item.imageUrl,
            child: Image.asset(
              item.imageUrl,
              height: 220,
            ),
          ),

          const SizedBox(
            height: 25,
          ),
          // food name
          Text(
            item.name,
            style: textStyle.displayMedium!.copyWith(
              color: colorScheme.primary,
            ),
          ),

          // food price
          Text(
              'IDR ${item.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.')}',
              style: textStyle.displayMedium!.copyWith(
                color: colorScheme.primary,
              )),

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
            item.description,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
