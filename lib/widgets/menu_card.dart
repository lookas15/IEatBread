import 'package:flutter/material.dart';
import '../models/menu_model.dart' as menu_model;
import '../screens/menu_details.dart';

class MenuCard extends StatefulWidget {
  final String category;
  final ValueNotifier<int> quantityNotifier; // Tambahkan properti ini

  const MenuCard(
      {Key? key, required this.category, required this.quantityNotifier})
      : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  List<menu_model.Menu> menu = menu_model.listMenu;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    double screenWidth = MediaQuery.of(context).size.width;

    // Menentukan apakah lebar layar saat ini adalah 300px
    bool isNarrowScreen = screenWidth <= 300;

    List<menu_model.Menu> filteredMenu =
        menu.where((item) => item.category == widget.category).toList();

    return Scaffold(
        backgroundColor: colorScheme.background,
        body: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: isNarrowScreen ? 1 : 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
          children: [for (var item in filteredMenu) ItemCard(item: item)],
        ));
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
  });

  final menu_model.Menu item;
  final int maxCharacters = 17;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    final formattedName = item.name.length > maxCharacters
        ? '${item.name.substring(0, maxCharacters)}...'
        : item.name;

    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MenuDetails(item: item);
          }));
        },
        child: Card(
            color: colorScheme.primaryContainer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  // Item Name & Favorite Toggle Button
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Text(
                        formattedName,
                        style: textTheme.headlineSmall!.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
                      )),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: colorScheme.onPrimaryContainer,
                        onPressed: () {
                          print("Favorited");
                        },
                      ),
                    ],
                  ),
                ),
                // Item Image
                ItemImage(item: item),
                SizedBox(height: 10),
                ItemPrice(item: item)
              ],
            )));
  }
}

class ItemPrice extends StatelessWidget {
  const ItemPrice({
    super.key,
    required this.item,
  });

  final menu_model.Menu item;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          'IDR ${item.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.')}',
          style: textTheme.displaySmall!.copyWith(
            color: colorScheme.surfaceTint,
          ),
        ),
      ),
    );
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
    required this.item,
  });

  final menu_model.Menu item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item.imageUrl),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
