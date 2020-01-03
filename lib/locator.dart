import 'package:get_it/get_it.dart';

import 'core/services/service.dart';
import 'core/view/CrudModel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserFarmerService('Users'));
  locator.registerLazySingleton(() => CRUDUserFarmerModel());
}