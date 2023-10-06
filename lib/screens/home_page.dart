import 'package:flutter/material.dart';
import '../widgets/wish_list_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  final userName = "Albert";

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.displayLarge!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        );

    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Hello, $userName', style: textStyle),
          Text('Welcome to', style: textStyle),
          Text('IEatBread', style: textStyle),
          SizedBox(height: 30),
          // Row is used to force the container to fit the whole screen
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return WishListWidget();
                  }));
                },
                icon: Icon(Icons.favorite_rounded),
                label: Text('My Wishlist'),
              ),
              IconButton(
                  color: Theme.of(context).colorScheme.onPrimary,
                  onPressed: () {
                    print('Go to settings');
                  },
                  icon: Icon(Icons.settings_outlined)),
            ],
          )
        ],
      ),
    );
  }
}
