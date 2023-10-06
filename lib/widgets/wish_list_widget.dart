import 'package:flutter/material.dart';
import 'package:product_listtt/models/menu_model.dart';
import 'package:product_listtt/screens/menu_details.dart';
import 'package:product_listtt/widgets/menu_card.dart';
import '../data/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishListWidget extends StatelessWidget {
  const WishListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        title: Text('Wish List'),
        elevation: 2,
      ),
      body: WishListBody(),
    );
  }
}

class WishListBody extends StatelessWidget {
  const WishListBody({super.key});
  final maxCharacters = 25;

  @override
  Widget build(BuildContext context) {
    final wishListProvider = context.watch<WishListProvider>();

    if (wishListProvider.wishListItems.isEmpty) {
      return Center(
        child: Text('Wish List is empty.'),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: wishListProvider.wishListItems.length,
              itemBuilder: (context, index) {
                final item = wishListProvider.wishListItems[index];

                return WishListItem(
                  item: item,
                );
              },
            ),
          ),
        ],
      );
    }
  }
}

class WishListItem extends StatelessWidget {
  const WishListItem({super.key, required this.item});

  final MenuModel item;
  final maxCharacters = 25;

  @override
  Widget build(BuildContext context) {
    final wishListProvider = context.watch<WishListProvider>();
    final formattedName = item.name.length > maxCharacters
        ? '${item.name.substring(0, maxCharacters)}...'
        : item.name;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MenuDetails(item: item),
          ),
        );
      },
      child: Card(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WishListImage(item: item),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(formattedName),
                  ItemPrice(item: item),
                  IconButton(
                      onPressed: () {
                        wishListProvider.removeItem(item);
                      },
                      icon: Icon(Icons.favorite)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WishListImage extends StatelessWidget {
  const WishListImage({
    super.key,
    required this.item,
  });

  final MenuModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item.imageUrl),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
