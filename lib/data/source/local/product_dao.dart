
import 'package:floor/floor.dart';
import 'package:wallpaper/data/source/local/product_entity.dart';
import 'package:wallpaper/data/source/local/product_entity.dart';
import 'package:wallpaper/data/source/local/product_entity.dart';

@dao
abstract class ProductDao {

  @Query('SELECT * FROM ProductEntity')
  Future<List<ProductEntity>> getAllItems();

  @insert
  Future<void> addItem(ProductEntity floorEntity);

  @delete
  Future<void> deleteItem(ProductEntity floorEntity);

}