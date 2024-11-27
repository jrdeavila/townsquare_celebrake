import 'package:townsquare/lib.dart';

class FakeCategoryRepository implements ICategoryRepository {
  final List<CategoryEntity> fakeCategories = [
    const CategoryEntity(
      id: "1",
      name: "Sports",
    ),
    const CategoryEntity(
      id: "2",
      name: "Food",
    ),
    const CategoryEntity(
      id: "3",
      name: "Kids",
    ),
    const CategoryEntity(
      id: "4",
      name: "Creative",
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
