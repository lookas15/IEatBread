import 'package:product_listtt/models/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

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

// creating database table
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

// inserting data into the table
  Future<Cart> insert(Cart cart) async {
    var dbClient = await database;
    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }

// getting all the items in the list from the database
  Future<List<Cart>> getCartList() async {
    // var dbClient = await database;
    // final List<Map<String, Object?>> queryResult =
    //     await dbClient!.query('cart');
    // return queryResult.map((result) => Cart.fromMap(result)).toList();
    var dbClient = await database;
    if (dbClient != null) {
      final List<Map<String, Object?>> queryResult =
          await dbClient.query('cart');
      return queryResult.map((result) => Cart.fromMap(result)).toList();
    } else {
      // Handle the case when dbClient is null, for example, by returning an empty list.
      return [];
    }
  }

  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await database;
    return await dbClient!.update('cart', cart.quantityMap(),
        where: "productId = ?", whereArgs: [cart.productId]);
  }

// deleting an item from the cart screen
  Future<int> deleteCartItem(int id) async {
    var dbClient = await database;
    return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  void initDB() {}
}
