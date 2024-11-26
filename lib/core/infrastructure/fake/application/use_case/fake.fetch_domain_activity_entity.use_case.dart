import 'package:townsquare/lib.dart';

class FakeFetchDomainActivityEntityUseCase
    implements IFetchDomainActivityEntityUseCase {
  final IActivityRepository _fakeActivityRepository;

  FakeFetchDomainActivityEntityUseCase(this._fakeActivityRepository);

  @override
  Future<List<ActivityEntity>> fetchActivityModel() {
    return _fakeActivityRepository.getActivities();
  }
}
