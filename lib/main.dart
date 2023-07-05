import 'package:find_cep_app/complements/http_methods.dart';
import 'package:find_cep_app/data/repositories/cep_repository_impl.dart';
import 'package:find_cep_app/domain/use_cases/get_cep_info.dart';
import 'package:find_cep_app/external/datasources/cep_datasource_impl.dart';
import 'package:find_cep_app/presenter/main_controller.dart';
import 'package:find_cep_app/presenter/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void createDependencies() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton(() => HttpRequestMethods());
  getIt.registerLazySingleton(() => CepDataSourceImpl(getIt<HttpRequestMethods>()));
  getIt.registerLazySingleton(() => CepRepositoryImpl(getIt<CepDataSourceImpl>()));
  getIt.registerLazySingleton(() => GetCepInfoImpl(getIt<CepRepositoryImpl>()));
  getIt.registerFactory(() => MainController(getIt<GetCepInfoImpl>()));
}

main() {
  final getIt = GetIt.instance;
  createDependencies();
  runApp(MaterialApp(
    home: MainHomePage(mainController: getIt<MainController>()),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: ThemeData.dark(),
  ));
}
