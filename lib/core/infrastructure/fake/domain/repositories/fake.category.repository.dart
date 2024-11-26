import 'package:townsquare/lib.dart';

class FakeCategoryRepository implements ICategoryRepository {
  final List<CategoryEntity> fakeCategories = [
    const CategoryEntity(
      id: "1",
      name: "Category 1",
    ),
    const CategoryEntity(
      id: "2",
      name: "Category 2",
    ),
    const CategoryEntity(
      id: "3",
      name: "Category 3",
    ),
  ];
  @override
  Future<List<CategoryEntity>> getCategories() {
    return Future.value(fakeCategories);
  }

  @override
  Future<CategoryEntity> getCategory(String id) {
    return Future.value(
        fakeCategories.firstWhere((element) => element.id == id));
  }
}
