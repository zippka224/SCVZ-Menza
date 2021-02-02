import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';

import 'package:menza_jelovnik/screens/mainMenu.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool network = true;

  @override
  void initState() {
    fetchJelovnik();
    super.initState();
  }

  fetchJelovnik() async {
    try {
      var response =
          await http.get("https://scvzmenza-app.herokuapp.com/danas");
      if (response.statusCode == 200) {
        setState(
          () {
            network = true;
            print("Online: $network");
          },
        );
        var jelovnik = jsonDecode(utf8.decode(response.bodyBytes));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return MainMenu(
              jelovnik: jelovnik,
            );
          }),
        );
      } else {
        setState(
          () {
            network = false;
            print("Online: $network");
          },
        );
      }
    } catch (e) {
      print("Online: $network");
      setState(() {
        network = false;
        Timer(
          Duration(seconds: 2),
          () {
            fetchJelovnik();
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: Stack(
            children: [
              Lottie.asset('images/loading_animation2.json'),
              Center(
                child: Image(
                  height: 150,
                  width: 150,
                  color: Color.fromRGBO(2, 153, 255, 1),
                  image: AssetImage("images/restoran_ikona.png"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
