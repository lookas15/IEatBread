import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../widgets/wish_list_widget.dart';
import 'package:provider/provider.dart';
import '../data/color_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          Text('Welcome to', style: textStyle),
          Text('IEatBread', style: textStyle),
          SizedBox(height: 50),
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
                  onPressed: () => _dialogBuilder(context),
                  icon: Icon(Icons.brush_outlined)),
            ],
          )
        ],
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  final colorProvider = Provider.of<ColorProvider>(context, listen: false);

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Pick Color Theme'),
        content: BlockPicker(
          pickerColor:
              colorProvider.currentColor, // default color from colorProvider
          onColorChanged: (Color color) {
            colorProvider.changeColor(color);
          },
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Done'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
