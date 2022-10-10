import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resto_app/ui/home_page.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/Homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 151, 204, 51),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Please Wait",
              style: TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(255, 156, 155, 155)),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 180, 180, 180),
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
