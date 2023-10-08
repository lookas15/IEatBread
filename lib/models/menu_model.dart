class MenuModel {
  final int id;
  final String name;
  final int price;
  final String imageUrl;
  final bool isFavorite;
  final String category;
  final String description;

  MenuModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageUrl,
      required this.isFavorite,
      required this.category,
      required this.description});

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
      'category': category,
      'description': description,
    };
  }
}

final List<MenuModel> listMenu = [
  MenuModel(
    id: 01,
    name: 'Croissant + Cold Brew',
    price: 30000,
    imageUrl: 'assets/img/croissbrew.png',
    isFavorite: true,
    category: 'Deals',
    description:
        "Wake up to a perfect morning with our Breakfast Bliss Combo Deal! Complement your croissant with our refreshing Cold Brew Coffee, expertly brewed to a smooth, bold finish. It's the perfect companion to your croissant, providing a cool and invigorating caffeine kick.",
  ),
  MenuModel(
    id: 02,
    name: 'Pain au Chocolate+ Croissant',
    price: 30000,
    imageUrl: 'assets/img/croau.png',
    isFavorite: false,
    category: 'Deals',
    description: "Experience the best of French pastries with our French Pastry Duos Combo Deal! Indulge in the perfect pairing of our Pain au Chocolat and Classic Croissant for a taste of authentic French pastry craftsmanship.",
  ),
  MenuModel(
    id: 03,
    name: 'Choux au Craquelin + Cream Puff',
    price: 15000,
    imageUrl: 'assets/img/chouxpuff.png',
    isFavorite: true,
    category: 'Deals',
    description: "Indulge in a symphony of pastry perfection with our Pastry Delight Duo Combo Deal! Savor the exquisite combination of Choux au Craquelin and Cream Puff, a duo that showcases the best of our pastry craftsmanship.",
  ),
  MenuModel(
    id: 04,
    name: 'Coffee Bun + Melonpan',
    price: 18000,
    imageUrl: 'assets/img/panbun.png',
    isFavorite: false,
    category: 'Deals',
    description:
        "Experience the ultimate baked goodness duet with our Coffee Bun + Melonpan Combo Deal! Enjoy the irresistible combination of our Coffee Bun and Melonpan, a duet that celebrates the art of baking.",
  ),
  MenuModel(
    id: 10,
    name: 'Pizza Bomb',
    price: 10000,
    imageUrl: 'assets/img/pizzabomb.png',
    isFavorite: false,
    category: 'Bread',
    description:
        "The round bread, crisp on the outside, holds a delightful secret within—a medley of tomato sauce, cheese, and pepperoni, waiting to surprise your taste buds.",
  ),
  MenuModel(
    id: 11,
    name: 'Cinnamon Roll',
    price: 10000,
    imageUrl: 'assets/img/cinroll.png',
    isFavorite: true,
    category: 'Bread',
    description:
        "A rolled bread filled with palm sugar, sprinkled with cinnamon powder, and crowned with cream cheese frosting as its topping.",
  ),
  MenuModel(
    id: 12,
    name: 'Chocolate Babka',
    price: 12000,
    imageUrl: 'assets/img/chocbabka.png',
    isFavorite: true,
    category: 'Bread',
    description:
        "A delicious brioche bun with a tempting chocolate coating and filling",
  ),
  MenuModel(
    id: 13,
    name: 'Cheesy Garlic Bead',
    price: 12000,
    imageUrl: 'assets/img/cgarlic.png',
    isFavorite: true,
    category: 'Bread',
    description:
        "Slices of savory bread toasted with fragrant butter and garlic, sprinkled with delicious melted cheese. The perfect combination of creamy taste and strong garlic taste.",
  ),
  MenuModel(
    id: 14,
    name: 'TangZhong Milk Bread',
    price: 15000,
    imageUrl: 'assets/img/tangzhong.png',
    isFavorite: false,
    category: 'Bread',
    description:
        "Soft bread with a special texture, thanks to the tangzhong dough that makes it soft and delicious, along with a mild and sweet milk flavor.",
  ),
  MenuModel(
    id: 15,
    name: 'Milk Bun',
    price: 10000,
    imageUrl: 'assets/img/milkbun.png',
    isFavorite: false,
    category: 'Bread',
    description:
        "Soft and delicious bread known for its distinctive milk flavor and tender texture.",
  ),
  MenuModel(
    id: 16,
    name: 'Melonpan',
    price: 12000,
    imageUrl: 'assets/img/melonpan.png',
    isFavorite: false,
    category: 'Bread',
    description:
        "Japanese sweet bread with a crispy outer texture, coated with biscuit dough and sugar that provides a sweet touch.",
  ),
  MenuModel(
    id: 17,
    name: 'Coffee Bun',
    price: 12000,
    imageUrl: 'assets/img/coffeebun.png',
    isFavorite: true,
    category: 'Bread',
    description:
        "Sweet bread with a crispy texture and a layer of coffee cream on top.",
  ),
  MenuModel(
    id: 20,
    name: 'Croissant',
    price: 18000,
    imageUrl: 'assets/img/croissant.png',
    isFavorite: true,
    category: 'Pastry',
    description:
        "A crescent-shaped pastry with a crispy exterior, a soft interior, and a distinctive buttery flavor.",
  ),
  MenuModel(
    id: 21,
    name: 'Pain Au Chocolat',
    price: 18000,
    imageUrl: 'assets/img/painauchoc.png',
    isFavorite: false,
    category: 'Pastry',
    description:
        "A French sweet bread composed of layers of buttery dough with melted chocolate within.",
  ),
  MenuModel(
    id: 22,
    name: 'Portuguese Egg Tart',
    price: 12000,
    imageUrl: 'assets/img/eggtart.png',
    isFavorite: true,
    category: 'Pastry',
    description:
        "A pastry of Portuguese origin featuring crispy layers of pastry crust with caramelization on top, filled with soft, vanilla-scented custard.",
  ),
  MenuModel(
    id: 23,
    name: 'Cheese Tart',
    price: 12000,
    imageUrl: 'assets/img/cheesetart.png',
    isFavorite: false,
    category: 'Pastry',
    description:
        "A petite pastry made with a crisp tart crust and filled with a creamy cheese filling."
,
  ),
  MenuModel(
    id: 24,
    name: 'Cream Puff',
    price: 8000,
    imageUrl: 'assets/img/creampuff.png',
    isFavorite: false,
    category: 'Pastry',
    description:
        "A round pastry featuring a light and airy puff pastry shell, filled with a soft, sweet, and vanilla-flavored custard."
,
  ),
  MenuModel(
    id: 25,
    name: 'Choux au Craquelin',
    price: 10000,
    imageUrl: 'assets/img/choux.png',
    isFavorite: true,
    category: 'Pastry',
    description:
        "A pastry coated with a craquelin layer, crafted from a blend of sugar, flour, and butter, and filled with a smooth and sweet diplomat cream.",
  ),
  MenuModel(
    id: 30,
    name: 'Cold Brew',
    price: 18000,
    imageUrl: 'assets/img/coldbrew.png',
    isFavorite: true,
    category: 'Drinks',
    description:
        "Coffee brewed with cold water, but your crush's attitude will still be cooler 🙌",
  ),
  MenuModel(
    id: 31,
    name: 'Americano',
    price: 16000,
    imageUrl: 'assets/img/amrcno.png',
    isFavorite: true,
    category: 'Drinks',
    description:
        "1940's style coffee that tastes bitter, but still more bitter, is rejected by your crush 🥤",
  ),
  MenuModel(
    id: 32,
    name: 'Vanilla Latte',
    price: 18000,
    imageUrl: 'assets/img/vanilla.png',
    isFavorite: false,
    category: 'Drinks',
    description:
        "Espresso coffee paired with milk, it's not like you don't have a partner 🧍‍♂️🧍‍♀️",
  ),
  MenuModel(
    id: 33,
    name: 'Affogato',
    price: 20000,
    imageUrl: 'assets/img/affogato.png',
    isFavorite: true,
    category: 'Drinks',
    description:
        "Coffee from Italy which means drowning. The difference is that you are drowning in his sweet promises 🐊",
  ),
  MenuModel(
    id: 34,
    name: 'Matcha Latte',
    price: 20000,
    imageUrl: 'assets/img/matcha.png',
    isFavorite: true,
    category: 'Drinks',
    description:
        'The drink is fragrant green tea combined with sweet milk, as sweet as his sweet talk 🧉',
  ),
  MenuModel(
    id: 35,
    name: 'Earl Grey Tea',
    price: 16000,
    imageUrl: 'assets/img/earlgrey.png',
    isFavorite: false,
    category: 'Drinks',
    description:
        'The tea is added with fragrant bergamot orange oil, as fragrant as the early days of dating 🍊',
  ),
];
