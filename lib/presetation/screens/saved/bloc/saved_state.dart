part of 'saved_bloc.dart';

@immutable
class SavedState {
  final List<ProductEntity> savedItemList;
  final String message;

  const SavedState({this.savedItemList = const [], this.message = ""});

  SavedState copyWith({List<ProductEntity>? savedItemList, String? message}) {
    return SavedState(
      savedItemList: savedItemList ?? this.savedItemList,
      message: message ?? this.message,
    );
  }
}
