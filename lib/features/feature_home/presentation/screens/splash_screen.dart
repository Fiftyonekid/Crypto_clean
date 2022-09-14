import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: SpinKitSpinningLines(
                size: 40.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Positioned(
              bottom: 30,
              child: Row(
                children: [
                  Text(
                    "From",
                    style: TextStyle(color: Color.fromARGB(255, 120, 176, 221)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Dandelion Co",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _checkConnectivity() async {
    await Connectivity().checkConnectivity().then(
      (result) {
        if (result == ConnectivityResult.none) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('No Internet Connection'),
                content: Text('Please check your internet connection'),
                actions: <Widget>[
                  InkWell(
                    child: Text('Retry...'),
                    onTap: () {
                      _checkConnectivity();
                    },
                  )
                ],
              );
            },
          );
        }
      },
    );
  }

// ===============================NEW API===============================

//   void getdata2() async {
//     await Future.delayed(Duration(seconds: 2));
//     var response = await Dio()
//         .get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd');
//     var jsonArray = response.data;
//     List<GetCryptoListModel>? cryptoList = jsonArray
//         .map<GetCryptoListModel>((jsonArray) => GetCryptoListModel.fromjson(jsonArray))
//         .toList();
//
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CoinList(cryptoList: cryptoList),
//       ),
//     );
//   }
}
