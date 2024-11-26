import 'package:townsquare/lib.dart';

class FakeFetchDomainCategoryEntityUseCase
    implements IFetchDomainCategoryEntityUseCase {
  final ICategoryRepository _fakeCategoryRepository;

  FakeFetchDomainCategoryEntityUseCase(this._fakeCategoryRepository);

  @override
  Future<List<CategoryEntity>> fetchCategoryModel() {
    return _fakeCategoryRepository.getCategories();
  }
}
