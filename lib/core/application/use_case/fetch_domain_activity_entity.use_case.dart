import 'package:townsquare/lib.dart';

abstract interface class IFetchDomainActivityEntityUseCase {
  Future<List<ActivityEntity>> fetchActivityModel();
}
