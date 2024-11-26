import 'package:townsquare/lib.dart';

abstract interface class IFetchDomainCategoryEntityUseCase {
  Future<List<CategoryEntity>> fetchCategoryModel();
}
