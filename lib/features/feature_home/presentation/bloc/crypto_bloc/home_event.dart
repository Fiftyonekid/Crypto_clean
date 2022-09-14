part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadCrEvent extends HomeEvent {
  String cryptoName;
  LoadCrEvent({required this.cryptoName});
}

class SearchCrEvent extends HomeEvent {
  final String value;
  SearchCrEvent(this.value);
}

class LoadWidgets extends HomeEvent {
  LoadWidgets();
}
