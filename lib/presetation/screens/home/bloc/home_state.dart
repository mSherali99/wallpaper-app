part of 'home_bloc.dart';

@immutable
class HomeState {

  final List<ProductEntity> resultList;
  final EnumState status;
  final String message;
  final int offside;

  const HomeState({
    this.resultList = const [],
    this.status = EnumState.inital,
    this.message = "",
    this.offside = 0
});

  HomeState copyWith({List<ProductEntity>? resultList, EnumState? status, String? message, int? offside}) {
    return HomeState(
      resultList: resultList ?? this.resultList,
      status: status ?? this.status,
      message: message ?? this.message,
      offside: offside ?? this.offside
    );
  }

}

