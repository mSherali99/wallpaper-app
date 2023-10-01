import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wallpaper/data/model/api_model.dart';

///   https://run.mocky.io/v3/c4c303de-216d-49d4-9954-ab79fc40553b

class MyApi {
  final _dio = Dio(BaseOptions(baseUrl: "https://run.mocky.io/", validateStatus: (status) => true));

  Future<List<ApiModel>> getAllList() async {
    try {
      List<ApiModel> resultList = [];
      final response = await _dio.get("v3/c4c303de-216d-49d4-9954-ab79fc40553b");
      int status = response.statusCode ?? 0;
      if (status >= 200 && status <= 300) {
        resultList = ((response.data as List).map((e) => ApiModel.fromJson(e))).toList();
      }
      return resultList;
    } catch (e) {
      debugPrint("catchda ${e}");
      return <ApiModel> [];
    }
  }

}