// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MenuDetails extends StatelessWidget {
  final String assetPath;
  final String price;
  final String name;
  final String details;
  final String category;

  const MenuDetails(
      {super.key,
      required this.assetPath,
      required this.price,
      required this.name,
      required this.details,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 89, 81),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pilihan',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              category,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 42.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 245, 89, 81),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Hero(
              tag: assetPath,
              child: Container(
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(assetPath),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              name,
              style: TextStyle(
                color: Color.fromARGB(255, 245, 89, 81),
                fontFamily: 'Poppins',
                fontSize: 24.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Rp $price',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 245, 89, 81),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(
                details,
                maxLines: 6,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Item Quantity',
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 89, 81),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {}, 
                            icon: Icon(Icons.remove, color: Colors.white,),
                            iconSize: 20,
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 89, 81),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {}, 
                            icon: Icon(Icons.add, color: Colors.white,),
                            iconSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 245, 89, 81),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    onPressed: () {}, 
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 50),
          //   child: ElevatedButton(
          //       onPressed: () {},
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
          //           Text('Add to Cart'),
          //           IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          //         ],
          //       )),
          // ),
        ],
      ),
    );
  }
}
