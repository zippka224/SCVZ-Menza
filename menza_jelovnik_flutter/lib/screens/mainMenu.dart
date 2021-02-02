import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../headerDanas.dart';
import '../dan.dart';
import './rucakDanas.dart';
import './veceraDanas.dart';

class MainMenu extends StatefulWidget {
  MainMenu({this.jelovnik});
  final jelovnik;

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  var jelovnik;
  var dan;
  var datum;
  double opacityRucak = 1;
  double opacityVecera = 0.25;
  bool jeVecera = false;
  double containerHeight = 0.665;

  //RUČAK
  Set<String> rucakJuhe;
  List<String> rucakMenu1;
  List<String> rucakMenu2;
  List<String> rucakMenu3;
  List<String> rucakMenuVege;
  List<String> rucakMenuDodatno;

  void _parseRucak() {
    GetRucakDanas rucakDanas = GetRucakDanas(jelovnik: jelovnik);
    rucakJuhe = rucakDanas.juheDanas;
    rucakMenu1 = rucakDanas.menu1;
    rucakMenu2 = rucakDanas.menu2;
    rucakMenu3 = rucakDanas.menu3;
    rucakMenuVege = rucakDanas.menuVege;
    rucakMenuDodatno = rucakDanas.menuDodatno;
  }

  //VEČERA
  List<String> veceraMenu1;
  List<String> veceraMenu2;
  List<String> veceraMenu3;
  List<String> veceraMenuVege;
  List<String> veceraMenuDodatno;

  void _parseVecera() {
    GetVeceraDanas veceraDanas = GetVeceraDanas(jelovnik: jelovnik);
    veceraMenu1 = veceraDanas.menu1;
    veceraMenu2 = veceraDanas.menu2;
    veceraMenu3 = veceraDanas.menu3;
    veceraMenuVege = veceraDanas.menuVege;
    veceraMenuDodatno = veceraDanas.menuDodatno;
  }

  //Prikaži ručak ili večeru
  Widget _showMeal() {
    Widget _meal;
    if (jeVecera == false) {
      _meal = RucakDanas(
        juhe: rucakJuhe,
        menu1: rucakMenu1,
        menu2: rucakMenu2,
        menu3: rucakMenu3,
        menuVege: rucakMenuVege,
        menuDodatno: rucakMenuDodatno,
      );
    } else if (jeVecera == true) {
      _meal = VeceraDanas(
        menu1: veceraMenu1,
        menu2: veceraMenu2,
        menu3: veceraMenu3,
        menuVege: veceraMenuVege,
        menuDodatno: veceraMenuDodatno,
      );
    }
    return _meal;
  }

  //Odredi je li vrijeme ručka ili večere
  void _doba() {
    final int _vrijeme = TimeOfDay.now().hour;
    if (_vrijeme <= 16) {
      containerHeight = 0.665;
      opacityRucak = 1.0;
      opacityVecera = 0.25;
      jeVecera = false;
      print("Vrijeme je ručka");
    } else {
      containerHeight = 0.570;
      opacityRucak = 0.25;
      opacityVecera = 1.0;
      jeVecera = true;
      print("Vrijeme je večere");
    }
  }

  @override
  void initState() {
    super.initState();
    jelovnik = widget.jelovnik;
    dan = Dan().danUTjednu(DateTime.now().weekday);
    datum = DateFormat("d.MM.yyyy").format(DateTime.now());
    _parseRucak();
    _parseVecera();
    _doba();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderDanas(dan: dan, datum: datum),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                color: Color.fromRGBO(224, 224, 224, opacityRucak),
                minWidth: 110,
                height: 35,
                child: Text(
                  "Ručak",
                  style: TextStyle(
                    fontWeight: jeVecera ? FontWeight.normal : FontWeight.bold,
                    color: jeVecera ? Colors.black38 : Colors.black,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    containerHeight = 0.665;
                    opacityRucak = 1.0;
                    opacityVecera = 0.25;
                    jeVecera = false;
                  });
                },
              ),
              FlatButton(
                color: Color.fromRGBO(224, 224, 224, opacityVecera),
                minWidth: 110,
                height: 35,
                onPressed: () {
                  setState(() {
                    containerHeight = 0.570;
                    opacityRucak = 0.25;
                    opacityVecera = 1.0;
                    jeVecera = true;
                  });
                },
                child: Text(
                  "Večera",
                  style: TextStyle(
                    fontWeight: jeVecera ? FontWeight.bold : FontWeight.normal,
                    color: jeVecera ? Colors.black : Colors.black38,
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx > 0) {
                setState(() {
                  containerHeight = 0.665;
                  opacityRucak = 1.0;
                  opacityVecera = 0.25;
                  jeVecera = false;
                });
              } else if (details.delta.dx < 0) {
                setState(() {
                  containerHeight = 0.570;
                  opacityRucak = 0.25;
                  opacityVecera = 1.0;
                  jeVecera = true;
                });
              }
            },
            child: AnimatedContainer(
              transform: Matrix4.translationValues(0.0, -6.6, 0.0),
              duration: Duration(milliseconds: 150),
              width: MediaQuery.of(context).size.width * 0.935,
              height: //515,
                  MediaQuery.of(context).size.height * containerHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0.0, 3),
                  ),
                ],
                color: Color.fromRGBO(224, 224, 224, 1),
              ),
              child: Padding(
                child: _showMeal(),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
