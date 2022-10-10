import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resto_app/data/model/restaurant_list.dart';
import 'package:resto_app/data/model/restaurant_search.dart';
import 'package:resto_app/data/model/restaurants_detail.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl + 'list'));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<SearchRestaurant> getTextField(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + "search?q=$query"));
    if (response.statusCode == 200) {
      return SearchRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<DetailRestaurant> getDetailId(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + 'detail/' + id));
    if (response.statusCode == 200) {
      return DetailRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
