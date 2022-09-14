import '../../domain/entities/get_crypto_list_entiry.dart';

class GetCryptoListModel extends GetCryptoListEntity {
 final String? name;
 final String? symbol;
 final String? image;
 final double? price_change_percentage_24h;
 final current_price_usd;
 final int? rank;
 final String? iconPath;
 const GetCryptoListModel(
      {this.name,
      this.symbol, this.image,
      this.price_change_percentage_24h,
      this.current_price_usd,
      this.rank,
      this.iconPath}) : super(iconPath: iconPath,
      rank: rank,
      price_change_percentage_24h: price_change_percentage_24h ,
      current_price_usd: current_price_usd,
      symbol: symbol,
      name: name);
  factory GetCryptoListModel.fromjson(Map<String, dynamic> jsonData) {
    return GetCryptoListModel(
      name:jsonData["name"],
      symbol: jsonData["symbol"],
      image: jsonData["image"],
      current_price_usd:jsonData["current_price"],
      price_change_percentage_24h:  jsonData["price_change_percentage_24h"],
      rank: jsonData["market_cap_rank"],
      iconPath: jsonData["image"],
    );
  }
}
