import 'package:flutter/material.dart';
import 'package:resto_app/widget/detail_restaurant.dart';
import 'package:provider/provider.dart';
import 'package:resto_app/provider/provider_detail.dart';
import 'package:resto_app/data/api/api_service.dart';
import 'package:resto_app/data/model/restaurants_detail.dart';
import 'package:resto_app/common/constant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final String idrestaurant;
  const RestaurantDetailPage({Key? key, required this.idrestaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime.shade300,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          "Restaurant App",
        ),
      ),
      backgroundColor: Colors.lime.shade200,
      body: ChangeNotifierProvider<DetailRestaurantProvider>(
        create: (_) => DetailRestaurantProvider(
            apiService: ApiService(), id: idrestaurant),
        child: Consumer<DetailRestaurantProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.state == ResultState.hasData) {
              final restaurants = state.result.restaurants;
              return RestaurantDetail(
                restaurant: restaurants,
              );
            } else if (state.state == ResultState.noData) {
              return Center(child: Text(state.message));
            } else if (state.state == ResultState.error) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text(''));
            }
          },
        ),
      ),
    );
  }
}
