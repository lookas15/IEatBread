import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/wishlist_provider.dart';
import '../models/menu_model.dart';
import '../screens/menu_details.dart';

class MenuCard extends StatefulWidget {
  final String category;
  final ValueNotifier<int> quantityNotifier;

  const MenuCard(
      {Key? key, required this.category, required this.quantityNotifier})
      : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  List<MenuModel> menu = listMenu;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    double screenWidth = MediaQuery.of(context).size.width;

    bool isNarrowScreen = screenWidth <= 300;
    bool isBigScreen = screenWidth >= 600;

    List<MenuModel> filteredMenu =
        menu.where((item) => item.category == widget.category).toList();

    return Scaffold(
        backgroundColor: colorScheme.background,
        body: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: isNarrowScreen
              ? 1
              : isBigScreen
                  ? 3
                  : 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: isBigScreen ? 0.9 : 0.8,
          children: [for (var item in filteredMenu) ItemCard(item: item)],
        ));
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
  });

  final MenuModel item;
  final int maxCharacters = 17;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    final wishListProvider = context.watch<WishListProvider>();

    IconData wishIcon;
    if (wishListProvider.contains(item)) {
      wishIcon = Icons.favorite;
    } else {
      wishIcon = Icons.favorite_border;
    }

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
                  padding: const EdgeInsets.all(10),
                  // Item Name & Favorite Toggle Button
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ItemName(name: formattedName),
                      IconButton(
                        icon: Icon(wishIcon),
                        color: colorScheme.onPrimaryContainer,
                        onPressed: () {
                          wishListProvider.toggleWishList(item);
                        },
                      ),
                    ],
                  ),
                ),
                // Item Image
                ItemImage(item: item),
                const SizedBox(height: 10),
                ItemPrice(item: item)
              ],
            )));
  }
}

class ItemName extends StatelessWidget {
  const ItemName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      name,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
    ));
  }
}

class ItemPrice extends StatelessWidget {
  const ItemPrice({
    super.key,
    required this.item,
  });

  final MenuModel item;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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

  final MenuModel item;

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
