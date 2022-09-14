import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interacting_with_api/features/feature_home/domain/entities/get_crypto_list_entiry.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/bloc/crypto_bloc/cr_status.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/bloc/crypto_bloc/home_bloc.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/bloc/theme_cubit.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/screens/splash_screen.dart';

import '../../../../core/screens/about_us_screen.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../core/widgets/change_them_button.dart';
import '../../../../core/widgets/get_percentage_color.dart';
import '../../../../core/widgets/get_static_style.dart';

class Temp extends StatefulWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  var searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCrEvent(cryptoName: "1"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            print("inside bi");
            return Row(children: [
              SizedBox(
                width: 6,
              ),
              Visibility(
                visible: !state.isSearching,
                child: ChangeThemeButtonWidget(),
              ),
            ]);
          }),
          title:
              BlocBuilder<HomeBloc, HomeState>(buildWhen: (previous, current) {
            if (previous.isSearching != current.isSearching) {
              return false;
            }
            return true;
          }, builder: (context, state) {
            if (state.isSearching == false) {
              return GestureDetector(
                  child: Text(
                    'کریپتوآلارم',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontFamily: "vazir",
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutUsScreen(),
                        ));
                  });
            }
            return TextField(
              textInputAction: TextInputAction.search,
              controller: searchController,
              onChanged: (value) {
                BlocProvider.of<HomeBloc>(context).add(SearchCrEvent(value));
              },
              cursorColor: Color.fromARGB(255, 233, 175, 16),
              cursorWidth: 2,
              cursorHeight: 25,
              textAlign: TextAlign.end,
              cursorRadius: Radius.circular(20),
              decoration: InputDecoration(
                hintText: '...نام ارز ',
                hintStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                prefixIcon: Container(
                  child: Icon(
                    Icons.search,
                    color: goldenColor,
                  ),
                ),
                labelStyle: TextStyle(color: goldenColor),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: -5.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIconColor: Color.fromARGB(255, 177, 212, 136),
                suffixIcon: searchController.text.isEmpty
                    ? Container(
                        width: 0,
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 228, 170, 10),
                        ),
                        onPressed: () {
                          searchController.clear();
                        },
                      ),
              ),
            );
          }),
          actions: <Widget>[
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.isSearching == true) {
                  return IconButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(LoadWidgets());
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: goldenColor,
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () {
                            context.read<HomeBloc>().add(LoadWidgets());
                          },
                          icon: Icon(
                            Icons.search,
                            size: 20,
                            color: Color.fromARGB(255, 228, 170, 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ]),
                  );
                }
              },
            )
          ]),
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state.crStatus is CrLoading) {
          print("Loading!!!");
          return SplashScreen();
        }

        /// show Error State for Cw
        if (state.crStatus is CrError) {
          return Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          );
        }
        print(searchController);
        if (state.crStatus is CrCompleted && searchController.text == '') {
          final CrCompleted crCompleted = state.crStatus as CrCompleted;
          final List<GetCryptoListEntity> cryptoListEntity =
              crCompleted.getCryptoListEntity;
          print(cryptoListEntity[0].name);
          return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 50,
                    endIndent: 50,
                  ),
              itemCount: 8,
              itemBuilder: (context, index) {
                final Crypto = cryptoListEntity[index];
                return _getTiles(Crypto, index);
              });
        }

        return Container();
      }),
    ));
    ;
  }

  Widget _getTiles(GetCryptoListEntity crypto, int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        height: 74,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          onLongPress: () {},
          leading: SizedBox(
            width: 250,
            height: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  height: double.infinity,
                ),
                ClipRRect(
                  child: Image.network(crypto.image.toString()),
                  borderRadius: BorderRadius.circular(50),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      crypto.name!,
                    ),
                    Text(crypto.symbol!),
                  ],
                ),
              ],
            ),
          ),
          trailing: SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      crypto.current_price_usd!.toStringAsFixed(2) + "\$",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      crypto.price_change_percentage_24h!.toStringAsFixed(2) +
                          '%',
                      style: GetPercentageColor(
                          crypto.price_change_percentage_24h!),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                GetStaticStyle(crypto.price_change_percentage_24h!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
