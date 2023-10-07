import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import '../models/cart_model.dart'; 
import '../models/order_model.dart'; 

class DBHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE cart(
          id INTEGER PRIMARY KEY, 
          productId VARCHAR UNIQUE, 
          productName TEXT, 
          initialPrice INTEGER, 
          productPrice INTEGER, 
          quantity INTEGER, 
          category TEXT, 
          image TEXT)
    ''');
  }
  
  void clearCart() async {
    var dbClient = await database;
    await dbClient!.delete('cart');
  }
  
  Future<Cart> insertOrUpdate(Cart cart) async {
    var dbClient = await database;
    final productId = cart.productId;

    final existingCartItem = await dbClient!.query(
      'cart',
      where: 'productId = ?',
      whereArgs: [productId],
    );

    if (existingCartItem.isNotEmpty) {
      final currentQuantity = existingCartItem[0]['quantity'] as int;
      await dbClient.update(
        'cart',
        {
          'quantity': currentQuantity +
              cart.quantity!
                  .value, // Menambahkan jumlah baru ke jumlah yang ada
        },
        where: 'productId = ?',
        whereArgs: [productId],
      );
    } else {
      await dbClient.insert('cart', cart.toMap());
    }

    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var dbClient = await database;
    if (dbClient != null) {
      final List<Map<String, Object?>> queryResult =
          await dbClient.query('cart');
      return queryResult.map((result) => Cart.fromMap(result)).toList();
    } else {
      return [];
    }
  }

  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await database;
    return await dbClient!.update('cart', cart.quantityMap(),
        where: "productId = ?", whereArgs: [cart.productId]);
  }

  Future<int> deleteCartItem(int id) async {
    var dbClient = await database;
    return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  void initDB() {}
}


