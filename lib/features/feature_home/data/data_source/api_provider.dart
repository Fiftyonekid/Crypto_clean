import 'package:dio/dio.dart';


class ApiProvider {
  Dio dio = Dio();
  Future<dynamic> GetList() async {
    print ("getting data");
    var response = await Dio()
        .get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd');
    print (" data fetched!!!");

    return response;
  }
}
