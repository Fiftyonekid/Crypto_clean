import 'package:dio/dio.dart';
import 'package:flutter_interacting_with_api/core/resource/data_state.dart';
import 'package:flutter_interacting_with_api/features/feature_home/data/data_source/api_provider.dart';

import 'package:flutter_interacting_with_api/features/feature_home/domain/entities/get_crypto_list_entiry.dart';

import '../../domain/repository/crypto_repository.dart';
import '../models/get_crypto_list_model.dart';

class CryptoRepositoryImp extends CryptoRepository{
  ApiProvider apiProvider;
  CryptoRepositoryImp(this.apiProvider);
  @override
  Future<DataState<List<GetCryptoListEntity>>> fetchCryptoData() async{

    try{
      Response response = await apiProvider.GetList();
      print (response.statusCode);
      if (response.statusCode == 200){
        print ('if worked !!');
        var jsonArray = response.data;
        List<GetCryptoListEntity>?  getCryptoListEntity =jsonArray.map<GetCryptoListModel>((jsonArray) => GetCryptoListModel.fromjson(jsonArray)).toList();
        print ("ddddddd");
        print(getCryptoListEntity![0].name);
        return DataSuccess(getCryptoListEntity);
      }
      else{
        return DataFailed("Something went wrong...");
      }
    }catch(e){

      return DataFailed("Fetal Error...");

    }


  }

}