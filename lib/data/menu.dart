class Menu {
  final int id;
  final String name;
  final String price;
  final String imageUrl;
  final bool isFavorite;
  final String category;

  Menu(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageUrl,
      required this.isFavorite,
      required this.category});
}

final List<Menu> listMenu = [
  Menu(
    id: 01,
    name: 'Croissant + Cold Brew',
    price: '30.000',
    imageUrl: 'assets/img/croissbrew.png',
    isFavorite: true,
    category: 'Deals',
  ),
  Menu(
    id: 02,
    name: 'Pain au + Croissant',
    price: '30.000',
    imageUrl: 'assets/img/croau.png',
    isFavorite: false,
    category: 'Deals',
  ),
  Menu(
    id: 03,
    name: 'Choux Pastry + Puff',
    price: '15.000',
    imageUrl: 'assets/img/chouxpuff.png',
    isFavorite: true,
    category: 'Deals',
  ),
  Menu(
    id: 04,
    name: ' Bun + Melonpan',
    price: '18.000',
    imageUrl: 'assets/img/panbun.png',
    isFavorite: false,
    category: 'Deals',
  ),
  Menu(
    id: 10,
    name: 'Pizza Bomb',
    price: '10.000',
    imageUrl: 'assets/img/pizzabomb.png',
    isFavorite: false,
    category: 'Bread',
  ),
  Menu(
    id: 11,
    name: 'Cinnamon Roll',
    price: '10.000',
    imageUrl: 'assets/img/cinroll.png',
    isFavorite: true,
    category: 'Bread',
  ),
  Menu(
    id: 12,
    name: 'Chocolate Babka',
    price: '12.000',
    imageUrl: 'assets/img/chocbabka.png',
    isFavorite: true,
    category: 'Bread',
  ),
  Menu(
    id: 13,
    name: 'Cheesy Garlic Bead',
    price: '12.000',
    imageUrl: 'assets/img/cgarlic.png',
    isFavorite: true,
    category: 'Bread',
  ),
  Menu(
    id: 14,
    name: 'TangZhong Milk Bread',
    price: '15.000',
    imageUrl: 'assets/img/tangzhong.png',
    isFavorite: false,
    category: 'Bread',
  ),
  Menu(
    id: 15,
    name: 'Milk Bun',
    price: '10.000',
    imageUrl: 'assets/img/milkbun.png',
    isFavorite: false,
    category: 'Bread',
  ),
  Menu(
    id: 16,
    name: 'Melonpan',
    price: '12.000',
    imageUrl: 'assets/img/melonpan.png',
    isFavorite: false,
    category: 'Bread',
  ),
  Menu(
    id: 17,
    name: 'Coffee Bun',
    price: '12.000',
    imageUrl: 'assets/img/coffeebun.png',
    isFavorite: true,
    category: 'Bread',
  ),
  Menu(
    id: 20,
    name: 'Croissant',
    price: '18.000',
    imageUrl: 'assets/img/croissant.png',
    isFavorite: true,
    category: 'Pastry',
  ),
  Menu(
    id: 21,
    name: 'Pain Au Chocolat',
    price: '18.000',
    imageUrl: 'assets/img/painauchoc.png',
    isFavorite: false,
    category: 'Pastry',
  ),
  Menu(
    id: 22,
    name: 'Portuguese Egg Tart',
    price: '12.000',
    imageUrl: 'assets/img/eggtart.png',
    isFavorite: true,
    category: 'Pastry',
  ),
  Menu(
    id: 23,
    name: 'Cheese Tart',
    price: '12.000',
    imageUrl: 'assets/img/cheesetart.png',
    isFavorite: false,
    category: 'Pastry',
  ),
  Menu(
    id: 24,
    name: 'Cream Puff',
    price: '8.000',
    imageUrl: 'assets/img/creampuff.png',
    isFavorite: false,
    category: 'Pastry',
  ),
  Menu(
    id: 25,
    name: 'Choux au Craquelin',
    price: '10.000',
    imageUrl: 'assets/img/choux.png',
    isFavorite: true,
    category: 'Pastry',
  ),
  Menu(
    id: 30,
    name: 'Cold Brew',
    price: '18.000',
    imageUrl: 'assets/img/coldbrew.png',
    isFavorite: true,
    category: 'Drinks',
  ),
  Menu(
    id: 31,
    name: 'Americano',
    price: '16.000',
    imageUrl: 'assets/img/amrcno.png',
    isFavorite: true,
    category: 'Drinks',
  ),
  Menu(
    id: 32,
    name: 'Vanilla Latte',
    price: '18.000',
    imageUrl: 'assets/img/vanilla.png',
    isFavorite: false,
    category: 'Drinks',
  ),
  Menu(
    id: 33,
    name: 'Affogato',
    price: '20.000',
    imageUrl: 'assets/img/affogato.png',
    isFavorite: true,
    category: 'Drinks',
  ),
  Menu(
    id: 34,
    name: 'Matcha Latte',
    price: '20.000',
    imageUrl: 'assets/img/matcha.png',
    isFavorite: true,
    category: 'Drinks',
  ),
  Menu(
    id: 35,
    name: 'Earl Grey Tea',
    price: '16.000',
    imageUrl: 'assets/img/earlgrey.png',
    isFavorite: false,
    category: 'Drinks',
  ),
];
