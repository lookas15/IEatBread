import 'package:flutter/material.dart';
import 'package:product_listtt/Widgets/NavbarWidget.dart';
import 'package:product_listtt/Widgets/PlusMinusButtons.dart';
import 'package:product_listtt/Widgets/ReusableWidget%20.dart';
import 'package:product_listtt/data/CartProvider.dart';
import 'package:product_listtt/data/DBHelper.dart';
import 'package:product_listtt/models/cart_model.dart';
import 'package:product_listtt/screens/MenuList.dart';
import 'package:provider/provider.dart';

class OrderCart extends StatefulWidget {
  const OrderCart({super.key});

  @override
  State<OrderCart> createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart>
    with SingleTickerProviderStateMixin {
  DBHelper? dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getData();
  }

  int selectedBottomNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

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
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Kembali ke layar sebelumnya
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MenuList()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartProvider>(
              builder: (BuildContext context, provider, widget) {
                if (provider.cart.isEmpty) {
                  return const Center(
                    child: Text(
                      'Your Cart is Empty',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.cart.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image(
                                height: 120,
                                width: 180,
                                image: AssetImage(provider.cart[index].image!),
                              ),
                              SizedBox(
                                // width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      text: TextSpan(
                                        text: 'Menu: ',
                                        style: TextStyle(
                                          color: Colors.blueGrey.shade800,
                                          fontSize: 16.0,
                                          fontFamily: 'Poppins',
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${provider.cart[index].productName!}\n',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      maxLines: 1,
                                      text: TextSpan(
                                        text: 'Unit: ',
                                        style: TextStyle(
                                          color: Colors.blueGrey.shade800,
                                          fontSize: 16.0,
                                          fontFamily: 'Poppins',
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${provider.cart[index].category!}\n',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      maxLines: 1,
                                      text: TextSpan(
                                        text: 'Price/each: ' r"IDR ",
                                        style: TextStyle(
                                          color: Colors.blueGrey.shade800,
                                          fontSize: 16.0,
                                          fontFamily: 'Poppins',
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${provider.cart[index].productPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.')}\n',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ValueListenableBuilder<int>(
                                valueListenable: provider.cart[index].quantity!,
                                builder: (context, val, child) {
                                  return PlusMinusButtons(
                                    addQuantity: () {
                                      setState(() {
                                        cart.addQuantity(
                                            provider.cart[index].id!);
                                        dbHelper!
                                            .updateQuantity(Cart(
                                                id: index,
                                                productId: index.toString(),
                                                productName: provider
                                                    .cart[index].productName,
                                                initialPrice: provider
                                                    .cart[index].initialPrice,
                                                productPrice: provider
                                                    .cart[index].productPrice,
                                                quantity: ValueNotifier(provider
                                                    .cart[index]
                                                    .quantity!
                                                    .value),
                                                category: provider
                                                    .cart[index].category,
                                                image:
                                                    provider.cart[index].image))
                                            .then((value) {
                                          cart.addTotalPrice(double.parse(
                                              provider.cart[index].productPrice
                                                  .toString()));
                                        });
                                      });
                                    },
                                    deleteQuantity: () {
                                      setState(() {
                                        cart.deleteQuantity(
                                            provider.cart[index].id!);
                                        cart.removeTotalPrice(double.parse(
                                            provider.cart[index].productPrice
                                                .toString()));
                                      });
                                    },
                                    text: val.toString(),
                                  );
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        dbHelper!.deleteCartItem(
                                            provider.cart[index].id!);
                                        provider.removeItem(
                                            provider.cart[index].id!);
                                        provider.removeCounter();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors
                                              .red, // Atur warna latar belakang merah
                                          borderRadius: BorderRadius.circular(
                                              5.0), // Atur border radius sesuai keinginan
                                        ),
                                        padding: EdgeInsets.all(
                                            10.0), // Atur padding sesuai keinginan
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center, // Tengahkan teks dan ikon
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: Colors
                                                  .white, // Atur warna ikon menjadi putih
                                            ),
                                            Text(
                                              'Delete Menu',
                                              style: TextStyle(
                                                color: Colors
                                                    .white, // Atur warna teks menjadi putih
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Consumer<CartProvider>(
            builder: (BuildContext context, value, Widget? child) {
              final ValueNotifier<int?> totalPrice = ValueNotifier(null);
              for (var element in value.cart) {
                totalPrice.value =
                    (element.productPrice! * element.quantity!.value) +
                        (totalPrice.value ?? 0);
              }
              return Column(
                children: [
                  ValueListenableBuilder<int?>(
                    valueListenable: totalPrice,
                    builder: (context, val, child) {
                      return ReusableWidget(
                        title: 'Sub-Total',
                        value: r'IDR ' + (val?.toStringAsFixed(2) ?? '0'),
                      );
                    },
                  ),
                ],
              );
            },
          )
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
