
import 'package:flutter_interacting_with_api/features/feature_home/domain/entities/get_crypto_list_entiry.dart';

import '../../../../core/resource/data_state.dart';

 abstract class CryptoRepository{
   Future <DataState<List<GetCryptoListEntity>>> fetchCryptoData();
}