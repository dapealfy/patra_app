import 'package:app/core/di/service_locator.dart';
import 'package:app/data/auth/network/auth_network.dart';
import 'package:app/data/auth/repository/auth_repository.dart';
import 'package:app/data/complaint/network/complaint_network.dart';
import 'package:app/data/complaint/repository/complaint_repository.dart';

Future configureAuthDependencies() async {
  serviceLocator.registerFactory<AuthNetwork>(() => AuthNetwork());
  serviceLocator.registerFactory<ComplaintNetwork>(() => ComplaintNetwork());

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepository(
      serviceLocator<AuthNetwork>(),
    ),
  );

  serviceLocator.registerFactory<ComplaintRepository>(
    () => ComplaintRepository(
      serviceLocator<ComplaintNetwork>(),
    ),
  );

}
