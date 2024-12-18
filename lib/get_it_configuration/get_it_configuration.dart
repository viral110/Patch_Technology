import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:patch_task/get_it_configuration/get_it_configuration.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configureDependencies () async {
  return getIt.init();
}