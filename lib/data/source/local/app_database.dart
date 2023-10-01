
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:wallpaper/data/source/local/product_entity.dart';
import 'product_dao.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [ProductEntity])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get dao;
}