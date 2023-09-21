import 'package:flutter/material.dart';
import 'package:product_listtt/data/menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      body: ListView(
        children: [
          // const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.63,
              ),
              itemBuilder: (context, index){
                return _buildCard(listMenu[index], context);
              },
              itemCount: listMenu.length,
            )
          ),
        ],
      )
    );
  }

  Widget _buildCard(Menu menu, context){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {},
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
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    menu.isFavorite
                      ? const Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 245, 89, 81),
                      )
                      : const Icon(
                        Icons.favorite_border,
                        color: Color.fromARGB(255, 245, 89, 81),
                      )
                  ],
                )
              ),
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
                    )
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text('IDR ${menu.price}',
              style: const TextStyle(
                color: Color.fromARGB(255, 245, 89, 81),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                ),
              ),
              Text(menu.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Row(
                    children: const [
                      Icon(
                        Icons.shopping_basket,
                        color: Color.fromARGB(255, 245, 89, 81),
                        size: 16,
                      ),
                      SizedBox(width: 6),
                      Text('Buy',
                        style: TextStyle(
                          color: Color.fromARGB(255, 245, 89, 81),
                          fontSize: 12
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Row(
                    children: const [
                      Icon(
                        Icons.remove_circle_outline,
                        color: Color.fromARGB(255, 245, 89, 81),
                        size: 16.0,
                      ),
                      SizedBox(width: 6),
                      Text('3',
                        style: TextStyle(
                          color: Color.fromARGB(255, 245, 89, 81),
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.add_circle_outline,
                        color: Color.fromARGB(255, 245, 89, 81),
                        size: 16.0,
                      )
                    ]
                  )
                ],
                  
                )
              )
            ],
          ),
        )
      ),
    );
    
  }
}