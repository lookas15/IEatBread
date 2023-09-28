class Menu {
  final int id;
  final String name;
  final String price;
  final String imageUrl;
  final bool isFavorite;
  final String category;
  final String description;

  Menu(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageUrl,
      required this.isFavorite,
      required this.category,
      required this.description});
}

final List<Menu> listMenu = [
  Menu(
    id: 01,
    name: 'Croissant + Cold Brew',
    price: '30.000',
    imageUrl: 'assets/img/croissbrew.png',
    isFavorite: true,
    category: 'Deals',
    description:
        'Gurihnya mentega yang dipadu dengan segarnya kopi, pilihan terbaik untuk menu di pagi hari',
  ),
  Menu(
    id: 02,
    name: 'Pain au + Croissant',
    price: '30.000',
    imageUrl: 'assets/img/croau.png',
    isFavorite: false,
    category: 'Deals',
    description: 'Combo spesial untuk kamu penikmat makanan asin-manis',
  ),
  Menu(
    id: 03,
    name: 'Choux Pastry + Puff',
    price: '15.000',
    imageUrl: 'assets/img/chouxpuff.png',
    isFavorite: true,
    category: 'Deals',
    description: 'Combo pastry yang cocok dipadu dengan minuman apapun',
  ),
  Menu(
    id: 04,
    name: ' Bun + Melonpan',
    price: '18.000',
    imageUrl: 'assets/img/panbun.png',
    isFavorite: false,
    category: 'Deals',
    description: '',
  ),
  Menu(
    id: 10,
    name: 'Pizza Bomb',
    price: '10.000',
    imageUrl: 'assets/img/pizzabomb.png',
    isFavorite: false,
    category: 'Bread',
    description:
        'Roti berbentuk bulat yang renyah di bagian luar dan memiliki kejutan di bagian dalam berupa paduan saus tomat, keju dan pepperoni.',
  ),
  Menu(
    id: 11,
    name: 'Cinnamon Roll',
    price: '10.000',
    imageUrl: 'assets/img/cinroll.png',
    isFavorite: true,
    category: 'Bread',
    description:
        'Roti gulung yang berisikan gula palem dengan bubuk kayu manis dan cream cheese frosting sebagai toppingnya.',
  ),
  Menu(
    id: 12,
    name: 'Chocolate Babka',
    price: '12.000',
    imageUrl: 'assets/img/chocbabka.png',
    isFavorite: true,
    category: 'Bread',
    description:
        'Roti dengan brioche yang legit dengan lapisan dan isian coklat yang menggoda.',
  ),
  Menu(
    id: 13,
    name: 'Cheesy Garlic Bead',
    price: '12.000',
    imageUrl: 'assets/img/cgarlic.png',
    isFavorite: true,
    category: 'Bread',
    description:
        'Potongan roti gurih yang dipanggang dengan mentega dan bawang putih yang harum, ditaburi dengan keju leleh yang lezat. Kombinasi yang sempurna antara cita rasa creamy dan rasa bawang putih yang tajam.',
  ),
  Menu(
    id: 14,
    name: 'TangZhong Milk Bread',
    price: '15.000',
    imageUrl: 'assets/img/tangzhong.png',
    isFavorite: false,
    category: 'Bread',
    description:
        'Roti lembut dengan tekstur istimewa, berkat adonan tangzhong yang membuatnya lembut dan lezat serta rasa susu yang ringan dan manis.',
  ),
  Menu(
    id: 15,
    name: 'Milk Bun',
    price: '10.000',
    imageUrl: 'assets/img/milkbun.png',
    isFavorite: false,
    category: 'Bread',
    description:
        'Roti lembut  dan lezat yang dikenal karena rasa susu yang khas dan teksturnya yang empuk.',
  ),
  Menu(
    id: 16,
    name: 'Melonpan',
    price: '12.000',
    imageUrl: 'assets/img/melonpan.png',
    isFavorite: false,
    category: 'Bread',
    description:
        'Roti manis Jepang yang memiliki tekstur luar yang renyah karena dilapisi dengan adonan biskuit dan gula yang memberikan sentuhan manis.',
  ),
  Menu(
    id: 17,
    name: 'Coffee Bun',
    price: '12.000',
    imageUrl: 'assets/img/coffeebun.png',
    isFavorite: true,
    category: 'Bread',
    description:
        'Roti manis dengan tekstur yang renyah dan lapisan krim kopi di bagian atasnya.',
  ),
  Menu(
    id: 20,
    name: 'Croissant',
    price: '18.000',
    imageUrl: 'assets/img/croissant.png',
    isFavorite: true,
    category: 'Pastry',
    description:
        'Pastry berbentuk bulan sabit dengan tekstur renyah di luar dan lembut di dalamnya serta rasa mentega yang khas.',
  ),
  Menu(
    id: 21,
    name: 'Pain Au Chocolat',
    price: '18.000',
    imageUrl: 'assets/img/painauchoc.png',
    isFavorite: false,
    category: 'Pastry',
    description:
        'Roti manis Prancis yang terdiri dari adonan berlapis mentega dan cokelat yang meleleh di dalamnya.',
  ),
  Menu(
    id: 22,
    name: 'Portuguese Egg Tart',
    price: '12.000',
    imageUrl: 'assets/img/eggtart.png',
    isFavorite: true,
    category: 'Pastry',
    description:
        'Pastry asal Portugal yang terdiri dari lapisan kulit pastry yang renyah dan karamelisasi di atasnya, diisi dengan custard lembut beraroma vanila.',
  ),
  Menu(
    id: 23,
    name: 'Cheese Tart',
    price: '12.000',
    imageUrl: 'assets/img/cheesetart.png',
    isFavorite: false,
    category: 'Pastry',
    description:
        'Pastry kecil yang terdiri dari adonan tart yang renyah dan diisi dengan isian keju.',
  ),
  Menu(
    id: 24,
    name: 'Cream Puff',
    price: '8.000',
    imageUrl: 'assets/img/creampuff.png',
    isFavorite: false,
    category: 'Pastry',
    description:
        'Pastry yang berbentuk bulat yang terdiri dari kulit pastry yang ringan dan berongga, diisi dengan custard yang lembut, manis, dan beraroma vanila.',
  ),
  Menu(
    id: 25,
    name: 'Choux au Craquelin',
    price: '10.000',
    imageUrl: 'assets/img/choux.png',
    isFavorite: true,
    category: 'Pastry',
    description:
        'Pastry yang dilapisi dengan lapisan craquelin, yang terbuat dari campuran gula, tepung, dan mentega, lalu diisi diplomat cream yang lembut dan manis.',
  ),
  Menu(
    id: 30,
    name: 'Cold Brew',
    price: '18.000',
    imageUrl: 'assets/img/coldbrew.png',
    isFavorite: true,
    category: 'Drinks',
    description:
        'Kopi yang diseduh dengan air dingin, tapi tetap lebih dingin sikap gebetan kamu 🙌',
  ),
  Menu(
    id: 31,
    name: 'Americano',
    price: '16.000',
    imageUrl: 'assets/img/amrcno.png',
    isFavorite: true,
    category: 'Drinks',
    description:
        'Kopi gaya abad 1940 yang terasa pahit, namun tetap lebih pahit ditolak sama gebetan 🥤',
  ),
  Menu(
    id: 32,
    name: 'Vanilla Latte',
    price: '18.000',
    imageUrl: 'assets/img/vanilla.png',
    isFavorite: false,
    category: 'Drinks',
    description:
        'Kopi espresso yang dipasangkan dengan susu, ga kayak kamu yang ga punya pasangan 🧍‍♂️🧍‍♀️',
  ),
  Menu(
    id: 33,
    name: 'Affogato',
    price: '20.000',
    imageUrl: 'assets/img/affogato.png',
    isFavorite: true,
    category: 'Drinks',
    description:
        'Kopi dari Italia yang artinya tenggelam. Bedanya kamu tenggelam sama janji manis dia 🐊',
  ),
  Menu(
    id: 34,
    name: 'Matcha Latte',
    price: '20.000',
    imageUrl: 'assets/img/matcha.png',
    isFavorite: true,
    category: 'Drinks',
    description:
        'Minuman berupa teh hijau yang harum dipadu dengan susu yang manis, semanis gombalan dia🧉',
  ),
  Menu(
    id: 35,
    name: 'Earl Grey Tea',
    price: '16.000',
    imageUrl: 'assets/img/earlgrey.png',
    isFavorite: false,
    category: 'Drinks',
    description:
        'Teh yang ditambahkan minyak jeruk bergamot yang harum, seharum masa awal-awal pacaran 🍊',
  ),
];
