import '../models/cart_model.dart';
import '../models/order_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _database;
  static Database? _databaseOrder;

  Future<Database?> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database?> get databaseOrder async {
    if (_databaseOrder != null) return _databaseOrder!;
    _databaseOrder = await initDatabaseOrder();
    return _databaseOrder!;
  }

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  initDatabaseOrder() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'order.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreateOrder);
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

  _onCreateOrder(Database database, int version) async {
    await database.execute('''
        CREATE TABLE orders(
          id TEXT PRIMARY KEY, 
          amount REAL, 
          dateTime TEXT, 
          products BLOB)
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
          'quantity': currentQuantity + cart.quantity!.value,
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
  
  Future<void> insertOrder(Order order) async {
    final database = await databaseOrder;
    if (database != null) {
      await database.insert(
        'orders',
        order.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      throw Exception('An error occured');
    }
  }

  Future<List<Order>> getOrders() async {
    final database = await databaseOrder;
    if (database != null) {
      final List<Map<String, dynamic>> maps = await database.query('orders');
      return List.generate(maps.length, (i) {
        return Order.fromMap(maps[i]);
      });
    } else {
      throw Exception('An error occured');
    }
  }

}
