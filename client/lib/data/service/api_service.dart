
import 'dart:developer';
import 'dart:io';

import 'package:coffee_app/domain/const.dart';
import 'package:dio/dio.dart';

import '../../domain/models/coffee.dart';

class RestApi {
  final _api = Dio(
    BaseOptions(
      baseUrl: url,
      headers: { 'Content-type': ContentType.json.mimeType }
    )
  );

  Future<List<Coffee>> getCoffeeList() async {
    final response = await _api.get('');
    log(response.data.toString());
    return (response.data as List)
        .map((e) => Coffee.fromMap(e))
        .toList();
  }
}