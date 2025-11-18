import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/produk_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'product_fav.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites(
            id INTEGER PRIMARY KEY,
            title TEXT,
            price REAL,
            description TEXT,
            category TEXT,
            image TEXT,
            rate REAL,
            count INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertFavorite(ProdukModel p) async {
    final db = await database;
    return db.insert('favorites', {
      'id': p.id,
      'title': p.title,
      'price': p.price,
      'description': p.description,
      'category': p.category.name,
      'image': p.image,
      'rate': p.rating.rate,
      'count': p.rating.count,
    });
  }

  Future<List<ProdukModel>> getFavorites() async {
    final db = await database;
    final data = await db.query('favorites');

    return data.map((m) {
      return ProdukModel(
        id: m['id'] as int,
        title: m['title'] as String,
        price: m['price'] as double,
        description: m['description'] as String,
        category: categoryValues.map[m['category']]!,
        image: m['image'] as String,
        rating: Rating(rate: m['rate'] as double, count: m['count'] as int),
      );
    }).toList();
  }

  Future<int> deleteFavorite(int id) async {
    final db = await database;
    return db.delete('favorites', where: "id = ?", whereArgs: [id]);
  }
}
