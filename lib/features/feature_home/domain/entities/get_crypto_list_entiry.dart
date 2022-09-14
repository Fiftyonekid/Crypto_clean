import 'package:equatable/equatable.dart';

class GetCryptoListEntity extends Equatable{
  final String? name;
  final String? symbol;
  final String? image;
  final double? price_change_percentage_24h;
  final current_price_usd;
  final int? rank;
  final String? iconPath;

   const GetCryptoListEntity(
      {this.name,
      this.symbol,
        this.image,
      this.price_change_percentage_24h,
      this.current_price_usd,
      this.rank,
      this.iconPath});



  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    symbol,
    price_change_percentage_24h,
    current_price_usd,
    rank,
    iconPath,
  ];

}