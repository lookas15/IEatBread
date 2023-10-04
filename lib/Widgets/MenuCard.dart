import 'package:flutter/material.dart';
import 'package:product_listtt/models/menu_model.dart' as menu_model;
import 'package:product_listtt/screens/MenuDetails.dart';

class MenuCard extends StatefulWidget {
  final String category;
  const MenuCard({Key? key, required this.category}) : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  List<menu_model.Menu> menu = menu_model.listMenu;

  @override
  Widget build(BuildContext context) {
    List<menu_model.Menu> filteredMenu =
        menu.where((item) => item.category == widget.category).toList();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, categoryIndex) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Dua kolom
              childAspectRatio: 0.7, // Mengontrol rasio tinggi lebar item
            ),
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // Agar tidak bisa digulir secara independen
            itemCount: filteredMenu.length,
            itemBuilder: (context, index) {
              final name = filteredMenu[index].name;
              final maxCharacters = 18;

              final formattedName = name.length > maxCharacters
                  ? name.substring(0, maxCharacters) + '...'
                  : name;

              return Padding(
                padding: const EdgeInsets.all(5),
                child: InkWell(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 3.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              filteredMenu[index].isFavorite
                                  ? Icon(
                                      Icons.favorite,
                                      color: Color.fromARGB(255, 245, 89, 81),
                                    )
                                  : SizedBox(height: 25.0)
                            ],
                          ),
                        ),
                        Hero(
                          tag: filteredMenu[index].imageUrl,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return MenuDetails(
                                  id: index,
                                  productId: filteredMenu[index].id.toString(),
                                  productName: filteredMenu[index].name,
                                  initialPrice: filteredMenu[index].price,
                                  productPrice: filteredMenu[index].price,
                                  category: filteredMenu[index].category,
                                  imageUrl: filteredMenu[index].imageUrl,
                                  details: filteredMenu[index].description,
                                );
                              }));
                            },
                            child: Container(
                              height: 90,
                              width: double.infinity, // Memenuhi lebar parent
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image:
                                      AssetImage(filteredMenu[index].imageUrl),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            formattedName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'IDR ${filteredMenu[index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.')}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 245, 89, 81),
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Color.fromARGB(255, 231, 231, 231),
                            height: 0.8,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return MenuDetails(
                                  id: index,
                                  productId: filteredMenu[index].id.toString(),
                                  productName: filteredMenu[index].name,
                                  initialPrice: filteredMenu[index].price,
                                  productPrice: filteredMenu[index].price,
                                  category: filteredMenu[index].category,
                                  imageUrl: filteredMenu[index].imageUrl,
                                  details: filteredMenu[index].description,
                                );
                              }));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffF55951),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.fastfood,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Details & Order',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
