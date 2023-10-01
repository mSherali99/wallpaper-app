import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper/data/model/api_model.dart';
import 'package:wallpaper/data/source/api/my_api.dart';
import 'package:wallpaper/data/source/local/app_database.dart';
import 'package:wallpaper/data/source/local/product_dao.dart';
import 'package:wallpaper/data/source/local/product_entity.dart';
import 'package:wallpaper/utils/utils.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MyApi _api;
  late ProductDao _productDao;
  late List<ProductEntity> getAllItem;

  HomeBloc(this._api) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      switch (event) {
        case LoadDataHomeEvent():
          await _loadDataHome(event, emit);
          break;
        case ClickHeartHomeScreen():
          await _clickHeartHome(event, emit);
          break;
      }
    });
  }

  Future<void> _loadDataHome(
      LoadDataHomeEvent event, Emitter<HomeState> emit) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      _productDao = db.dao;
      final List<ApiModel> responseList = [];
      responseList.addAll(await _api.getAllList());
      // emit(state.copywith(resultList: responseList.map((e) async => e.toProductEntity(await _isSaved())).toList()));
      final List<ProductEntity> list = [];
      emit(state.copyWith(
          resultList: await _addItem(responseList), status: EnumState.success));
    } catch (e) {
      emit(state.copyWith(message: "$e"));
    }
  }

  Future<List<ProductEntity>> _addItem(List<ApiModel> responseList) async {
    final List<ProductEntity> list = [];
    for (int i = 0; i < responseList.length; ++i) {
      list.add(
        ProductEntity(
          id: responseList[i].id,
          imageUrl: responseList[i].imageUrl,
          name: responseList[i].name,
          category: responseList[i].category,
          isSaved: await _isSaved(responseList[i].id),
        ),
      );
    }
    return list;
  }

  Future<bool> _isSaved(int index) async {
    getAllItem = await _productDao.getAllItems();
    for (int i = 0; i < getAllItem.length; ++i) {
      if (getAllItem[i].id == index) {
        return true;
      }
    }
    return false;
  }

  Future<void> _clickHeartHome(
      ClickHeartHomeScreen event, Emitter<HomeState> emit) async {
    if (event.productItem.isSaved) {
      _deleteItemFloor(event.productItem);
    } else {
      _addItemFloor(event.productItem);
    }
    final List<ProductEntity> list = [];
    for (int i = 0; i < state.resultList.length; ++i) {
      if (state.resultList[i].id == event.productItem.id) {
        list.add(ProductEntity(
          id: event.productItem.id,
          imageUrl: event.productItem.imageUrl,
          name: event.productItem.name,
          category: event.productItem.category,
          isSaved: event.productItem.isSaved != true,
        ));
      } else {
        list.add(state.resultList[i]);
      }
    }
    emit(state.copyWith(resultList: list));
  }

  Future<void> _deleteItemFloor(ProductEntity productItem) async {
    await _productDao.deleteItem(ProductEntity(
      id: productItem.id,
      imageUrl: productItem.imageUrl,
      name: productItem.name,
      category: productItem.category,
      isSaved: false,
    ));
  }

  Future<void> _addItemFloor(ProductEntity productItem) async {
    await _productDao.addItem(ProductEntity(
      id: productItem.id,
      imageUrl: productItem.imageUrl,
      name: productItem.name,
      category: productItem.category,
      isSaved: true,
    ));
  }
}
