import 'package:flutter/material.dart';
import 'package:flutter_application/data/menu.dart';
import 'package:flutter_application/widget/MenuDetails.dart';

class MenuCard extends StatelessWidget {
  final String category;
  const MenuCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 190.0,
            child: ListView.builder(
              itemCount: listMenu.length,
              itemBuilder: (context, index) {
                if (listMenu[index].category == category) {
                  return _buildCard(listMenu[index], context);
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

  Widget _buildCard(Menu menu, context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return MenuDetails(
                  assetPath: menu.imageUrl,
                  price: menu.price,
                  name: menu.name,
                  details: menu.description,
                  category: menu.category,
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
                        menu.isFavorite
                            ? const Icon(
                                Icons.favorite,
                                color: Color.fromARGB(255, 245, 89, 81),
                              )
                            : const SizedBox(height: 25.0)
                      ],
                    )),
                Hero(
                  tag: menu.imageUrl,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(menu.imageUrl),
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'IDR ${menu.price}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 245, 89, 81),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  menu.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 30, 5, 10),
                  child: Container(
                    color: const Color.fromARGB(255, 231, 231, 231),
                    height: 0.8,
                  ),
                ),
                InkWell(
                    onTap: () {
                      print("Added to Cart");
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffF55951),
                            borderRadius: BorderRadiusDirectional.circular(10),
                          ),
                          // Padding(padding: EdgeInsets.only(top: 15)),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_basket,
                                color: Color.fromARGB(255, 255, 255, 255),
                                size: 22,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        )))
              ],
            ),
          )),
    );
  }
}
