import 'dart:io';

import 'package:objectdb/objectdb.dart';
import 'package:path_provider/path_provider.dart';

class FavoriteDB {
  getPath() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = documentDirectory.path + '/favorites.db';
    print(path);
    return path;
  }

  //Insertion
  add(Map item) async {
    final db = ObjectDB(await getPath());
    db.open();
    db.insert(item);
    await db.close();
  }

  Future<int> remove(Map item) async {
    final db = ObjectDB(await getPath());
    db.open();
    int val = await db.remove(item);
    await db.close();
    return val;
  }

  Future<List> listAll() async {
    final db = ObjectDB(await getPath());
    db.open();
    List val = await db.find({});
    await db.close();
    return val;
  }

  Future<List> check(Map item) async {
    final db = ObjectDB(await getPath());
    db.open();
    List val = await db.find(item);
    await db.close();
    return val;
  }
}
