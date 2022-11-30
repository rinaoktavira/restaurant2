import 'dart:async';
import 'dart:io';

import 'package:resto_app/data/api/api_service.dart';
import 'package:resto_app/data/model/restaurant_list.dart';
import 'package:resto_app/ui/restaurant_list.dart';
import 'package:flutter/material.dart';
import 'package:resto_app/common/constant.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  late RestaurantResult _restaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantResult get result => _restaurantResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.topHeadlines();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Lost Connection";
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
