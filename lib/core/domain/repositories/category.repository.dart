import 'package:townsquare/lib.dart';

abstract interface class ICategoryRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<CategoryEntity> getCategory(String id);
}
