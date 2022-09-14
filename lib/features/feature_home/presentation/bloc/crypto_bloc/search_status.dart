import '../../../domain/entities/get_crypto_list_entiry.dart';

abstract class SearchStatus {}
class SrLoading extends SearchStatus{

}
class SrCompleted  extends SearchStatus{
  final List<GetCryptoListEntity> CryptoList;
  SrCompleted(this.CryptoList);

}
class SrError extends SearchStatus{}