import 'package:flutter/material.dart';
import 'package:resto_app/data/model/restaurants_detail.dart';
import 'package:resto_app/common/constant.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final Restaurant restaurant;
  const RestaurantDetail({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: restaurant.pictureId,
              child: Image.network(
                "https://restaurant-api.dicoding.dev/images/medium/" +
                    restaurant.pictureId,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(restaurant.name),
                          _sizebox(10),
                          Row(
                            children: [
                              _icon(Icons.location_city, 20, Colors.grey),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(restaurant.city),
                                  Text(restaurant.address),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _icon(Icons.star_rate, 20, Colors.yellow),
                          Text(
                            ' ${restaurant.rating}',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                _barrierContent(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, right: 20, left: 20),
                      child: Text('Description'),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            top: 10, right: 20, left: 20, bottom: 20),
                        width: double.infinity,
                        child: Text(restaurant.description)),
                  ],
                ),
                _barrierContent(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Text('Category'),
                      ListBody(
                        children: restaurant.categories.map((food) {
                          return Text(
                            '- ${food.name}',
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                _barrierContent(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Text('Menu Food'),
                      ListBody(
                        children: restaurant.menus.foods.map((categori) {
                          return Text(
                            '- ${categori.name}',
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                _barrierContent(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Text('Menu Drink'),
                      ListBody(
                        children: restaurant.menus.drinks.map((drink) {
                          return Text('- ${drink.name}');
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                _barrierContent(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Text('Comment'),
                      ListBody(
                        children: restaurant.customerReviews.map((review) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Expanded(
                              child: Row(children: [
                                Container(
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue),
                                  child: Center(
                                      child: Text(
                                    review.name.characters.elementAt(0),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            review.name,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            ' ${review.date}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade500),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 270,
                                        child: Text(
                                          review.review,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                _barrierContent()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _barrierContent() {
  return Container(
    height: 10,
    color: Colors.grey.shade200,
  );
}

Widget _sizebox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget _icon(IconData icon, double size, Color color) {
  return Icon(
    icon,
    size: size,
    color: color,
  );
}
