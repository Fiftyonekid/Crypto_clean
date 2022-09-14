import 'package:flutter_interacting_with_api/core/resource/data_state.dart';
import 'package:flutter_interacting_with_api/core/use_case/use_case.dart';
import 'package:flutter_interacting_with_api/features/feature_home/domain/repository/crypto_repository.dart';

import '../entities/get_crypto_list_entiry.dart';

class GetCryptoListUsecase extends UseCase{
  final CryptoRepository cryptoRepository;
  GetCryptoListUsecase(this.cryptoRepository);
  @override
  Future<DataState<List<GetCryptoListEntity>>> call(param) async {
    return cryptoRepository.fetchCryptoData();
  }


}