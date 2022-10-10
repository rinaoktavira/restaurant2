import 'dart:async';
import 'dart:io';
import 'package:resto_app/data/api/api_service.dart';
import 'package:resto_app/data/model/restaurant_search.dart';
import 'package:flutter/material.dart';

enum ResultState { loading, noData, hasData, error }

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchRestaurantProvider({required this.apiService}) {
    fetchAllRestaurant(search);
  }

  SearchRestaurant? _restaurantResult;
  ResultState? _state;
  String _message = '';
  String _search = '';

  String get message => _message;

  SearchRestaurant? get result => _restaurantResult;

  String get search => _search;

  ResultState? get state => _state;

  Future<dynamic> fetchAllRestaurant(String search) async {
    try {
      if (search.isNotEmpty) {
        _state = ResultState.loading;
        _search = search;
        notifyListeners();
        final restaurant = await apiService.getTextField(search);
        if (restaurant.restaurants.isEmpty) {
          _state = ResultState.noData;
          notifyListeners();
          return _message = 'Empty Data Boss!';
        } else {
          _state = ResultState.hasData;
          notifyListeners();
          return _restaurantResult = restaurant;
        }
      } else {
        return _message = 'text null';
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message =
          "Terjadi kesalahan saat menghubungkan, silahkan cek koneksi anda";
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
