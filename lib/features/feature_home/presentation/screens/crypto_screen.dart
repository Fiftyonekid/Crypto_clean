// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_interacting_with_api/core/utils/shared_perf.dart';
// import 'package:flutter_interacting_with_api/features/feature_home/data/models/get_crypto_list_model.dart';
// import 'package:flutter_interacting_with_api/features/feature_home/domain/entities/get_crypto_list_entiry.dart';
// import 'package:flutter_interacting_with_api/features/feature_home/presentation/bloc/crypto_bloc/home_bloc.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../core/utils/constants/constants.dart';
// import '../../../../core/widgets/change_them_button.dart';
// import '../../../../core/screens/about_us_screen.dart';
// import '../bloc/crypto_bloc/cr_status.dart';

// // ignore: must_be_immutable
// class CryptoScreen extends StatefulWidget {
//   CryptoScreen({Key? key}) : super(key: key);

//   @override
//   State<CryptoScreen> createState() => _coinsListState();
// }

// class _coinsListState extends State<CryptoScreen> {
//   PageController pageController = PageController();
//   List<GetCryptoListEntity> cryptoList= [];
//   List<GetCryptoListEntity> newList= [];
//   List<GetCryptoListEntity> temp = [];
//   List<GetCryptoListEntity> FavTemp = [];
//   List<String>? listOfFavs = [];
//   List<GetCryptoListEntity> favoriteCoins = [];
//   List<String> AddedCoins = [];
//   late bool isAddedBefore;
//   var numberOfFavoritesCoins;
//   int numberOfFavoritesCoins2 = 0;
//   bool isSearching = false;

//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<HomeBloc>(context).add(LoadCrEvent(""));
//     print ("the page has been initiated!!!");
//     List<GetCryptoListModel> cryptoList;
//     // newList = cryptoList;
//     // InitialFavList(listOfFavs);
//     // listOfFavs = SharedPref.getFavoiteCoinList() ?? [];
//     // listOfFavs!.forEach((element) {
//     //   FavTemp.add(cryptoList![int.parse(element) - 1]);
//     // });
//     // favoriteCoins = FavTemp;
//   }

//   final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

//   final searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(56),
//           child: BlocBuilder< HomeBloc, HomeState>(
//   builder: (context, state) {
//     return AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               centerTitle: true,
//               automaticallyImplyLeading: false,
//               leading: Row(children: [
//                 SizedBox(
//                   width: 6,
//                 ),
//                 Visibility(
//                   child: ChangeThemeButtonWidget(),
//                   visible: !isSearching,
//                 ),
//               ]),
//               title: !isSearching
//                   ? GestureDetector(
//                       child: Text(
//                         'کریپتوآلارم',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).primaryColor,
//                           fontSize: 20,
//                           fontFamily: "vazir",
//                         ),
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => AboutUsScreen(),
//                             ));
//                       })
//                   : TextField(
//                       textInputAction: TextInputAction.search,
//                       controller: searchController,
//                       onChanged: (value) {
//                         BlocProvider.of<HomeBloc>(context)
//                             .add(SearchCrEvent(value));
//                       },
//                       cursorColor: Color.fromARGB(255, 233, 175, 16),
//                       cursorWidth: 2,
//                       cursorHeight: 25,
//                       textAlign: TextAlign.end,
//                       cursorRadius: Radius.circular(20),
//                       decoration: InputDecoration(
//                         hintText: '...نام ارز ',
//                         hintStyle: TextStyle(
//                             color: Theme.of(context).primaryColor,
//                             fontWeight: FontWeight.bold),
//                         prefixIcon: Container(
//                           child: Icon(
//                             Icons.search,
//                             color: goldenColor,
//                           ),
//                         ),
//                         labelStyle: TextStyle(color: goldenColor),
//                         contentPadding: EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: -5.0),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.transparent),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Theme.of(context).primaryColor, width: 1.0),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         prefixIconColor: Color.fromARGB(255, 177, 212, 136),
//                         suffixIcon: searchController.text.isEmpty
//                             ? Container(
//                                 width: 0,
//                               )
//                             : IconButton(
//                                 icon: Icon(
//                                   Icons.close,
//                                   color: Color.fromARGB(255, 228, 170, 10),
//                                 ),
//                                 onPressed: () {
//                                   searchController.clear();
//                                   setState(() {
//                                     newList = cryptoList;
//                                   });
//                                 },
//                               ),
//                       ),
//                     ),
//               actions: <Widget>[
//                 state.isSearching
//                     ? IconButton(
//                         onPressed: () {
//                           context.read<HomeBloc>().isSelected;
//                           setState(() {
//                             isSearching = !isSearching;
//                           });
//                         },
//                         icon: Icon(
//                           Icons.arrow_forward,
//                           color: goldenColor,
//                         ),
//                       )
//                     : Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Row(children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey.shade300),
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                             child: IconButton(
//                               onPressed: () {
//                                 /// toDo!!!
//                                 isSearching = !isSearching;
//                               },
//                               icon: Icon(
//                                 Icons.search,
//                                 size: 20,
//                                 color: Color.fromARGB(255, 228, 170, 10),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                         ]),
//                       ),
//               ]);
//   },
// ),
//         ),
//         body: PageView(
//           children: [
//             PageView(
//               controller: pageController,
//               children: [
//                 Container(
//                   child: Column(
//                     children: [
//                       Container(
//                         child: Expanded(
//                           child: RefreshIndicator(
//                             color: Theme.of(context).indicatorColor,
//                             strokeWidth: 2.5,
//                             onRefresh: () async {
//                               List<GetCryptoListModel> updatedCryptoList =
//                                   await _getdata2();
//                               cryptoList = updatedCryptoList;
//                               setState(
//                                 () {
//                                   newList = updatedCryptoList;
//                                 },
//                               );
//                             },
//                             child: ListView.separated(
//                               separatorBuilder:
//                                   (BuildContext context, int index) {
//                                 print ("we are here !!");
//                                 var state = context.watch<HomeBloc>().state;
//                                 final CrCompleted crCompleted= state.crStatus as CrCompleted;
//                                 newList = crCompleted.getCryptoListEntity;
//                                 print ("-----------------------------------------");
//                                 print (newList);
//                                return Divider(
//                                  thickness: 1,
//                                  color: Colors.grey,
//                                  indent: 50,
//                                  endIndent: 50,
//                                );
//                               },
//                               itemCount: newList.length,
//                               itemBuilder: (context, index) {
//                                 final Crypto = newList[index];
//                                 // print("---> AAA");
//                                 // print(newList![index].name);
//                                 return _getTiles(Crypto, index);
//                               },

//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   child: FavTemp.isEmpty
//                       ? Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               'assets/images/data-not.png',
//                               height: 150,
//                               width: 150,
//                             ),
//                             Text(
//                               'هیچ ارزی در لیست علاقه مندی هایتان وجود ندارد',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         )
//                       : ListView.separated(
//                           separatorBuilder: (BuildContext context, int index) =>
//                               const Divider(
//                             thickness: 1,
//                             color: Colors.grey,
//                             indent: 80,
//                             endIndent: 80,
//                           ),
//                           itemCount: FavTemp.length,
//                           itemBuilder: (context, index) {
//                             final Crypto = FavTemp[index];
//                             return _getTiles(Crypto, index);
//                           },
//                         ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _getNewListItems(String Value) {
//     if (Value.isEmpty) {
//       temp = cryptoList;
//     } else {
//       temp = cryptoList
//           .where(
//             (crypto) =>
//                 crypto.name!.toLowerCase().contains(
//                       Value.toLowerCase(),
//                     ) ||
//                 crypto.symbol!.toLowerCase().contains(
//                       Value.toLowerCase(),
//                     ),
//           )
//           .toList();
//     }
//     setState(() {
//       newList = temp;
//     });
//   }

//   // Future<List<Crypto2>> _getdata() async {
//   //   var response = await Dio().get('https://api.coincap.io/v2/assets');
//   //   var jsonArray = response.data['data'];
//   //   print(jsonArray);
//   //   List<Crypto2> cryptoList = jsonArray
//   //       .map<Crypto2>((jsonArray) => Crypto2.fromjson(jsonArray))
//   //       .toList();

//   //   return cryptoList;
//   // }
//   Future<List<GetCryptoListModel>> _getdata2() async {
//     var response = await Dio()
//         .get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd');
//     var jsonArray = response.data;
//     print(jsonArray);
//     List<GetCryptoListModel> cryptoList = jsonArray
//         .map<GetCryptoListModel>(
//             (jsonArray) => GetCryptoListModel.fromjson(jsonArray))
//         .toList();

//     return cryptoList;
//   }

//   bool isPressed = false;

//   Widget _getTiles(GetCryptoListEntity crypto, int index) {
//     return Padding(
//       padding: EdgeInsets.all(5),
//       child: GestureDetector(
//         onTap: () => setState(() => isPressed = !isPressed),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           alignment: Alignment.center,
//           height: 74,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: BlocBuilder<HomeBloc , HomeState>(
//             buildWhen: (previous, current) {
//               if (previous.crStatus == current.crStatus){
//                 return false;
//               }
//               return true;
//             },
//             builder: (context , state) {
//               return
//               ListTile(

//                 /// ToDo
//                 onLongPress: () {},
//                 leading: SizedBox(
//                   width: 250,
//                   height: double.infinity,
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         height: double.infinity,
//                       ),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         width: 30,
//                         child: _getIsFavoriteStyle(crypto, index),
//                       ),
//                       ClipRRect(
//                         child: _getIcon(crypto),
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       SizedBox(width: 10),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             crypto.name!,
//                           ),
//                           Text(crypto.symbol!),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 trailing: SizedBox(
//                   width: 300,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             crypto.current_price_usd.toStringAsFixed(2) + "\$",
//                             style: TextStyle(fontWeight: FontWeight.w500),
//                           ),
//                           Text(
//                             crypto.price_change_percentage_24h!.toStringAsFixed(
//                                 2) +
//                                 '%',
//                             style: _getPercentColor(
//                                 crypto.price_change_percentage_24h!),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       _getRiseFall(crypto.price_change_percentage_24h!),
//                       BlocBuilder<HomeBloc, HomeState>(
//                         buildWhen: (previous, current) =>
//                         previous.isSelected != current.isSelected,
//                         builder: (context, state) {
//                           return PopupMenuButton(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(15),
//                               ),
//                             ),
//                             itemBuilder: (context) {
//                               setState(() {
//                                 isAddedBefore =
//                                     listOfFavs!.contains(
//                                         crypto.rank.toString());
//                                 print(numberOfFavoritesCoins);
//                               });
//                               return [
//                                 PopupMenuItem(
//                                   textStyle: TextStyle(
//                                       fontFamily: 'vazir',
//                                       color: Theme
//                                           .of(context)
//                                           .primaryColor),
//                                   value: 'edit',
//                                   child: Text('افزودن به مورد علاقه های من'),
//                                   enabled: state.isSelected,
//                                   onTap: () async {
//                                     final crypto = newList[index];
//                                     if (!listOfFavs!.contains(
//                                         crypto.rank.toString())) {
//                                       // the list is empty
//                                       favoriteCoins.add(crypto);
//                                       listOfFavs =
//                                           SharedPref.getFavoiteCoinList();

//                                       FavTemp.clear();
//                                       setState(() {
//                                         AddedCoins.add(crypto.rank.toString());
//                                         listOfFavs!.add(crypto.rank.toString());
//                                       });
//                                       listOfFavs!.forEach((element) {
//                                         FavTemp.add(
//                                             cryptoList[int.parse(element) -
//                                                 1]);
//                                         print(FavTemp);
//                                       });
//                                       await SharedPref.setCoinIndex(
//                                           listOfFavs!);
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         SnackBar(
//                                           content: Text(
//                                             '.به مورد علاقه های من اضافه شد',
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               color: Theme
//                                                   .of(context)
//                                                   .snackBarTheme
//                                                   .actionTextColor,
//                                             ),
//                                           ),
//                                           duration: Duration(seconds: 1),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(
//                                                 20),
//                                           ),
//                                           backgroundColor: Theme
//                                               .of(context)
//                                               .snackBarTheme
//                                               .backgroundColor,
//                                           behavior: SnackBarBehavior.floating,
//                                         ),
//                                       );
//                                     } else {
//                                       // the list isn't empty
//                                       bool doesHaveItem =
//                                       favoriteCoins.contains(crypto);
//                                       if (!doesHaveItem &&
//                                           favoriteCoins.length < 10) {
//                                         favoriteCoins.add(crypto);
//                                       }
//                                     }
//                                   },
//                                 ),

//                                 PopupMenuItem(
//                                   textStyle: TextStyle(
//                                       fontFamily: 'vazir',
//                                       color: Theme
//                                           .of(context)
//                                           .primaryColor),
//                                   enabled: isAddedBefore,
//                                   child: Text('حذف کردن از مورد علاقه های من'),
//                                   onTap: () async {
//                                     FavTemp.clear();
//                                     setState(() {
//                                       AddedCoins.remove(crypto.rank.toString());
//                                       listOfFavs!.remove(
//                                           crypto.rank.toString());
//                                     });
//                                     listOfFavs!.forEach((element) {
//                                       FavTemp.add(
//                                           cryptoList[int.parse(element) - 1]);
//                                       print(FavTemp);
//                                     });
//                                     await SharedPref.setCoinIndex(listOfFavs!);
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                           duration: Duration(seconds: 1),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(
//                                                 20),
//                                           ),
//                                           content: Text(
//                                             '.از مورد علاقه های من حذف شد',
//                                             style: TextStyle(
//                                               color: Theme
//                                                   .of(context)
//                                                   .snackBarTheme
//                                                   .actionTextColor,
//                                             ),
//                                             textAlign: TextAlign.center,
//                                           ),
//                                           backgroundColor: Theme
//                                               .of(context)
//                                               .snackBarTheme
//                                               .backgroundColor,
//                                           behavior: SnackBarBehavior.floating),
//                                     );
//                                   },
//                                 )
//                               ];
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }
//           ),
//         ),
//       ),
//     );
//   }

//   void InitialFavList(listOfFavs) async {
//     await SharedPreferences.getInstance().then((prefs) => {
//           listOfFavs = prefs.getStringList('coinNames'),
//         });
//     setState(() {
//       listOfFavs = listOfFavs;
//     });
//   }

//   // void setCoinNameToPrefs(String coinIndex) async {
//   //   print(listOfFavs);

//   //   await SharedPreferences.getInstance().then(
//   //     (prefs) {
//   //       if (!listOfFavs!.contains(coinIndex)) {
//   //         listOfFavs!.add(coinIndex);
//   //         print(listOfFavs);
//   //         prefs.setStringList('coinNames', listOfFavs!);
//   //         print("AAA|COin");
//   //         print(listOfFavs);
//   //         print("AAA|1");
//   //       }
//   //     },
//   //   );
//   // }

//   List<String> getfavsCoinNames() {
//     return listOfFavs ?? [];
//   }

//   void removeCoinNameToPrefs(String CoinName) async {
//     var list;
//     await SharedPreferences.getInstance().then((prefs) {
//       list = prefs.getStringList('coinNames');
//     });
//     list.remove(CoinName);
//   }

//   void IncNumberOfCoinsInToPrefs() {
//     if (numberOfFavoritesCoins == null) {
//       numberOfFavoritesCoins = 1;
//     }
//     SharedPreferences.getInstance().then((prefs) {
//       numberOfFavoritesCoins2 = numberOfFavoritesCoins2 + 1;
//       prefs.setInt('numberOfCoins', numberOfFavoritesCoins2);
//       numberOfFavoritesCoins = prefs.getInt('numberOfCoins')!;
//     });
//   }

//   void DecNumberOfCoinsInToPrefs() {
//     numberOfFavoritesCoins2 = numberOfFavoritesCoins2 - 1;

//     SharedPreferences.getInstance().then(
//       (prefs) {
//         prefs.setInt('numberOfCoins', numberOfFavoritesCoins2);
//         numberOfFavoritesCoins = prefs.getInt('numberOfCoins')!;
//       },
//     );
//   }

//   Widget _getIsFavoriteStyle(GetCryptoListEntity crypto, index) {
//     bool exists = listOfFavs!.contains(crypto.rank.toString());
//     return exists
//         ? Text(crypto.rank.toString(),
//             style: TextStyle(
//                 color: Color.fromARGB(255, 255, 196, 0),
//                 fontWeight: FontWeight.bold))
//         : Text(
//             crypto.rank.toString(),
//           );
//   }

//   _getRiseFall(double value) {
//     if (value > 0) {
//       return Icon(
//         Icons.trending_up,
//         color: Colors.green,
//       );
//     } else if (value < 0) {
//       return Icon(
//         Icons.trending_down,
//         color: Colors.red,
//       );
//     } else {
//       return Icon(Icons.trending_flat);
//     }
//   }

//   _getPercentColor(double value) {
//     if (value > 0) {
//       return TextStyle(color: Colors.green);
//     } else if (value < 0) {
//       return TextStyle(color: Colors.red[600]);
//     } else {
//       return TextStyle(color: Colors.white);
//     }
//   }

//   Widget _getIcon(cryp) {
//     // print("assets/icon/${(cryp.symbol).toLowerCase()}.svg");
//     // return SvgPicture.asset(
//     //   "assets/icon/${(cryp.symbol).toLowerCase()}.svg",
//     // );
//     return Image(
//       image: NetworkImage(cryp.iconPath),
//       width: 45,
//       height: 45,
//     );
//   }
// }
