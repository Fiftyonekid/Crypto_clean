import 'package:flutter/material.dart';
import 'package:flutter_interacting_with_api/features/feature_home/data/data_source/api_provider.dart';
import 'package:flutter_interacting_with_api/features/feature_home/data/repositroy/crypto_repositor_imp.dart';
import 'package:flutter_interacting_with_api/features/feature_home/domain/repository/crypto_repository.dart';
import 'package:flutter_interacting_with_api/features/feature_home/domain/use_case/get_crypto_list_usecase.dart';
import 'package:flutter_interacting_with_api/features/feature_home/domain/use_case/search_crypto_usecase.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/bloc/crypto_bloc/home_bloc.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/bloc/theme_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
setup() {
  locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<CryptoRepository>(CryptoRepositoryImp(locator()));
  locator
      .registerSingleton<GetCryptoListUsecase>(GetCryptoListUsecase(locator()));
  // locator.registerSingleton<SearchCryptoUsecase>(SearchCryptoUsecase())
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
  locator.registerSingleton<ThemeCubit>(ThemeCubit());
}
