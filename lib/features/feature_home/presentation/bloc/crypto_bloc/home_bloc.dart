import 'package:bloc/bloc.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/bloc/crypto_bloc/search_status.dart';
import '../../../../../core/resource/data_state.dart';
import '../../../domain/entities/get_crypto_list_entiry.dart';
import '../../../domain/use_case/get_crypto_list_usecase.dart';
import 'cr_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCryptoListUsecase getCryptoListUsecas;
  // final SearchCryptoUsecase searchCrypto;
  HomeBloc(this.getCryptoListUsecas)
      : super(HomeState(
            crStatus: CrLoading(),
            searchStatus: SrLoading(),
            isSearching: false,
            cryptoLis: [])) {
    on<LoadCrEvent>((event, emit) async {
      emit(state.copyWith(newCrStatus: CrLoading()));
      final DataState dataState = await getCryptoListUsecas(event.cryptoName);
      if (dataState is DataSuccess) {
        emit(state.copyWith(newCrStatus: CrCompleted(dataState.data)));
      } else if (dataState is DataFailed) {
        print(dataState.error.toString());
        emit(state.copyWith(newCrStatus: CrError(dataState.error.toString())));
      }
    });
    // on<SearchCrEvent> ((event , emit) async {
    //   final List<GetCryptoListEntity> cryptoList = await searchCrypto(event.value);
    //   emit(state.copyWith(newSearchStatus: SrCompleted(cryptoList)));
    // });
    on<LoadWidgets>((event, emit) {
      state.isSearching = !state.isSearching;

      emit(state.copyWith(newIsSearching: state.isSearching));
    });
  }
}
