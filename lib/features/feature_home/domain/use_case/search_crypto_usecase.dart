import 'package:flutter_interacting_with_api/core/use_case/use_case.dart';

import '../entities/get_crypto_list_entiry.dart';

class SearchCryptoUsecase extends UseCase{
  List<GetCryptoListEntity> cryptoList;
  SearchCryptoUsecase(this.cryptoList);
  @override
  Future<List<GetCryptoListEntity>> call(param) async{
    if (param == ""){
      return cryptoList;
    }else{
      cryptoList = cryptoList.where((element) =>element.name!.toLowerCase().contains(param.toLowerCase()) ||
        element.symbol!.toLowerCase().contains(param.toLowerCase())
      ).toList();
      return cryptoList;
    }
  }

}