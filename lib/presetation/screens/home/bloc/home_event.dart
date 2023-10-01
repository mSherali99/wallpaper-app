part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadDataHomeEvent extends HomeEvent {}

class ClickHeartHomeScreen extends HomeEvent {
  final ProductEntity productItem;
  ClickHeartHomeScreen({required this.productItem});
}
