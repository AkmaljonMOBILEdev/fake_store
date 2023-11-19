import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/cart_sql/cart_sql.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("cart.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";
    const doubleType = "REAL NOT NULL";
    const numType = "REAL";



    await db.execute('''
    CREATE TABLE ${CartModelFields.cartTable} (
    ${CartModelFields.id} $idType,
    ${CartModelFields.title} $textType,
    ${CartModelFields.price} $numType,
    ${CartModelFields.description} $textType,
    ${CartModelFields.category} $textType,
    ${CartModelFields.image} $textType,
    ${CartModelFields.ratingRate} $numType,
    ${CartModelFields.ratingCount} $intType
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }

  static Future<CartSql> insert(CartSql cartSql) async {
    final db = await getInstance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      CartModelFields.cartTable,
      where: '${CartModelFields.title} = ?',
      whereArgs: [cartSql.title],
    );
    if(maps.isEmpty){
      final int id = await db.insert(
        CartModelFields.cartTable,
        cartSql.toJson(),
      );
      return cartSql.copyWith(id: id);
    }
    return cartSql;
  }


  static Future<List<CartSql>> getAll() async {
    List<CartSql> allInCart = [];
    final db = await getInstance.database;
    allInCart = (await db.query(CartModelFields.cartTable))
        .map((e) => CartSql.fromJson(e))
        .toList();

    return allInCart;
  }


  static Future<int> delete(int id) async {
    final db = await getInstance.database;
    int count = await db.delete(
      CartModelFields.cartTable,
      where: "${CartModelFields.id} = ?",
      whereArgs: [id],
    );
    return count;
  }

  static Future<int> deleteAll() async {
    final db = await getInstance.database;
    int count = await db.delete(CartModelFields.cartTable);
    return count; // Returns the number of items deleted
  }



// static Future<ModelSql?> getSingle(int id) async {
  //   List<ModelSql> contacts = [];
  //   final db = await getInstance.database;
  //   contacts = (await db.query(
  //     ModelFields.contactsTable,
  //     where: "${ModelFields.id} = ?",
  //     whereArgs: [id],
  //   ))
  //       .map((e) => ModelSql.fromJson(e))
  //       .toList();
  //
  //   if (contacts.isNotEmpty) {
  //     return contacts.first;
  //   }
  //   return null;
  // }

  // static Future<List<ModelSql>> getByAlphabet(
  //     String order) async {
  //   List<ModelSql> allToDos = [];
  //   final db = await getInstance.database;
  //   allToDos = (await db.query(ModelFields.contactsTable,
  //           orderBy: "${ModelFields.name} $order"))
  //       .map((e) => ModelSql.fromJson(e))
  //       .toList();
  //   return allToDos;
  // }

  // static Future<List<ModelSql>> getByQuery(String query) async {
  //   List<ModelSql> allToDos = [];
  //   final db = await getInstance.database;
  //   allToDos = (await db.query(
  //     ModelFields.contactsTable,
  //     where: "${ModelFields.name} LIKE ?",
  //     whereArgs: [query],
  //   ))
  //       .map((e) => ModelSql.fromJson(e))
  //       .toList();
  //   return allToDos;
  // }
}
