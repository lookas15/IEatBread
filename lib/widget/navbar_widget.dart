import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.transparent,
      elevation: 8,
      child: Container(
        height: 50.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.home,
                    color: Colors.black
                  ),
                  Icon(
                    Icons.breakfast_dining_outlined,
                    color: Color.fromARGB(255, 245, 89, 81),
                  ),
                  Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.black,
                  ),
                  Icon(
                    Icons.person_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}