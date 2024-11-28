/// Configures the dependencies for the application using the GetX package.
///
/// This function registers the following dependencies as lazy singletons:
/// - `ICategoryRepository`: An instance of the `FakeCategoryRepository` class.
/// - `IActivityRepository`: An instance of the `FakeActivityRepository` class.
/// - `IFetchDomainActivityEntityUseCase`: An instance of the
///  `FakeFetchDomainActivityEntityUseCase` class.
/// - `IFetchDomainCategoryEntityUseCase`: An instance of the
/// `FakeFetchDomainCategoryEntityUseCase` class.
///
/// - `ActivityModelService`: An instance of the `ActivityModelService` class.
/// This service is used to fetch the activity and category models.
/// It depends on the `IFetchDomainActivityEntityUseCase` and
/// `IFetchDomainCategoryEntityUseCase` use cases.
///
/// - `Intl`: Initializes the date formatting for the application.
///
/// - `AppColors`: An instance of the `AppColors` class, which can be accessed
///   using `AppColors.getInstance()`.
/// - `AppStrings`: An instance of the `AppStrings` class, which can be accessed
///   using `AppStrings.getInstance()`.
/// - `ThemeController`: An instance of the `ThemeController` class.
///  This controller is used to manage the theme of the application.
/// - `LocaleController`: An instance of the `LocaleController` class.
/// This controller is used to manage the locale of the application.
/// - `ExceptionController`: An instance of the `ExceptionController` class.
/// This controller is used to manage the exceptions in the application.
///
/// These dependencies can be retrieved later using `Get.find<T>()`.
library;

import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

void configureDependencies() async {
  // Repositories
  Get.lazyPut<ICategoryRepository>(() => FakeCategoryRepository());
  Get.lazyPut<IActivityRepository>(() => FakeActivityRepository());
  // Use Cases
  Get.lazyPut<IFetchDomainActivityEntityUseCase>(
    () => FakeFetchDomainActivityEntityUseCase(
      Get.find<IActivityRepository>(),
    ),
  );
  Get.lazyPut<IFetchDomainCategoryEntityUseCase>(
    () => FakeFetchDomainCategoryEntityUseCase(
      Get.find<ICategoryRepository>(),
    ),
  );
  // Services of UI
  Get.lazyPut<ActivityModelService>(() => ActivityModelService(
        Get.find<IFetchDomainActivityEntityUseCase>(),
        Get.find<IFetchDomainCategoryEntityUseCase>(),
      ));
  // INTL
  // await initializeDateFormatting("es");
  // Controllers
  Get.put<ResponsiveController>(ResponsiveController());
  Get.lazyPut<AppTranslations>(() => AppTranslations());
  Get.lazyPut<AppColors>(() => AppColors.getInstance());
  Get.lazyPut<AppStrings>(() => AppStrings.getInstance());
  Get.put<ThemeController>(ThemeController());
  Get.put<LocaleController>(LocaleController());
  Get.put<ExceptionController>(ExceptionController());
}
