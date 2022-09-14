import 'package:flutter/foundation.dart';
import 'package:flutter_interacting_with_api/features/feature_home/domain/entities/get_crypto_list_entiry.dart';

@immutable
abstract class CrStatus{}
class CrLoading extends CrStatus{}
class CrCompleted extends CrStatus{
  final List<GetCryptoListEntity> getCryptoListEntity;
  CrCompleted(this.getCryptoListEntity);
}
class CrError extends CrStatus{
  final String message;
  CrError(this.message);
}
