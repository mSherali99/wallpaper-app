
import 'package:floor/floor.dart';
import 'package:wallpaper/data/model/api_model.dart';

@entity
class ProductEntity {

  @PrimaryKey(autoGenerate: false)
  final int id;
  final String imageUrl;
  final String name;
  final String category;
  final bool isSaved;

  ProductEntity({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.isSaved
  });

  ApiModel toApiModel() {
    return ApiModel(id: id, imageUrl: imageUrl, name: name, category: category);
  }

}