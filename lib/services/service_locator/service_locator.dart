
import 'package:fake_store/data/local/db/local_database.dart';
import 'package:fake_store/data/network/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItSetup(){
getIt.registerLazySingleton<ApiService>(() => ApiService());
}