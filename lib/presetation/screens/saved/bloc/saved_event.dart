part of 'saved_bloc.dart';

@immutable
abstract class SavedEvent {}

class LoadDataSavedScreen extends SavedEvent {}

class ClickHeartSavedScreen extends SavedEvent {
  final ProductEntity productItem;
  ClickHeartSavedScreen({required this.productItem});
}
