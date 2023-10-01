import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper/data/source/local/app_database.dart';
import 'package:wallpaper/data/source/local/product_dao.dart';

import '../../../../data/source/local/product_entity.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {

  late final ProductDao productDao;
  late List<ProductEntity> getAllList;

  SavedBloc() : super(const SavedState()) {
    on<SavedEvent>((event, emit) async {
      switch (event) {
        case LoadDataSavedScreen():
          await _loadDataSaved(event, emit);
          break;
        case ClickHeartSavedScreen():
          await _clickHeartSaved(event, emit);
          break;
      }
    });
  }

  Future<void> _loadDataSaved(LoadDataSavedScreen event, Emitter<SavedState> emit) async {
    try {
      final db = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      productDao = db.dao;
      getAllList = await productDao.getAllItems();
      emit(state.copyWith(savedItemList: getAllList));
    }
    catch (e) {
      emit(state.copyWith(message: "$e"));
    }
  }

  Future<void> _clickHeartSaved(ClickHeartSavedScreen event, Emitter<SavedState> emit) async {
    await productDao.deleteItem(event.productItem);
    getAllList = await productDao.getAllItems();
    emit(state.copyWith(savedItemList: getAllList));
  }
}
