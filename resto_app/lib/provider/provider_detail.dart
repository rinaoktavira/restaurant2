import 'dart:async';
import 'dart:io';

import 'package:resto_app/data/api/api_service.dart';
import 'package:resto_app/data/model/restaurants_detail.dart';
import 'package:flutter/material.dart';

enum ResultState { loading, noData, hasData, error }

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  late DetailRestaurant _detailRestaurant;
  late ResultState _state;
  String _message = '';

  DetailRestaurantProvider({required this.id, required this.apiService}) {
    getDetailRestaurant(id);
  }

  String get message => _message;
  DetailRestaurant get result => _detailRestaurant;
  ResultState get state => _state;

  Future<dynamic> getDetailRestaurant(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final detailRestaurant = await apiService.getDetailId(id);
      if (detailRestaurant.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _detailRestaurant = detailRestaurant;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message =
          "Terjadi kesalahan saat menghubungkan, silahkan cek koneksi anda!!";
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = e.toString();
    }
  }
}
