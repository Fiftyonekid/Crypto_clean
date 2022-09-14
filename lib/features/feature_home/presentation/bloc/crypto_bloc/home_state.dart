part of 'home_bloc.dart';

class HomeState{
  CrStatus crStatus;
  SearchStatus searchStatus;
  bool isSearching;
  List<GetCryptoListEntity> cryptoLis;

  HomeState({required this.crStatus , required this.searchStatus ,required this.isSearching , required this.cryptoLis});

  HomeState  copyWith({  CrStatus? newCrStatus,  SearchStatus? newSearchStatus , bool? newIsSearching , List<GetCryptoListEntity>? newCryptoList  })
  {

    return HomeState(
        crStatus: newCrStatus ?? crStatus,
        searchStatus: newSearchStatus ?? searchStatus,
      isSearching: newIsSearching ?? isSearching,
      cryptoLis: newCryptoList ?? cryptoLis,
    );
  }
}