import 'package:flutter/material.dart';

class GetVeceraDanas {
  var jelovnik;
  Map vecera;
  GetVeceraDanas({this.jelovnik}) {
    vecera = jelovnik["VECERA"];
  }

  List<String> get menu1 {
    List _menu1 = vecera["1"];
    List<String> _menu1String = [];
    _menu1.forEach((element) {
      _menu1String.add(element);
    });
    return _menu1String;
  }

  List<String> get menu2 {
    List _menu2 = vecera["2"];
    List<String> _menu2String = [];
    _menu2.forEach((element) {
      _menu2String.add(element);
    });
    return _menu2String;
  }

  List<String> get menu3 {
    List _menu3 = vecera["3"];
    List<String> _menu3String = [];
    _menu3.forEach((element) {
      _menu3String.add(element);
    });
    return _menu3String;
  }

  List<String> get menuVege {
    List _menuVege = vecera["VEGE"];
    List<String> _menuVegeString = [];
    _menuVege.forEach((element) {
      _menuVegeString.add(element);
    });
    return _menuVegeString;
  }

  List<String> get menuDodatno {
    List _menuDodatno = vecera["DODATNO"];
    List<String> _menuDodatnoString = [];
    _menuDodatno.forEach((element) {
      _menuDodatnoString.add(element);
    });

    return _menuDodatnoString;
  }
}

class VeceraDanas extends StatelessWidget {
  final List<String> menu1;
  final List<String> menu2;
  final List<String> menu3;
  final List<String> menuVege;
  final List<String> menuDodatno;
  VeceraDanas(
      {this.menu1, this.menu2, this.menuVege, this.menuDodatno, this.menu3});

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.normal);
    double razmakVertikalno = 45;
    double velicinaIkona = 60;
    var divider = Divider(thickness: 4.0, color: Colors.black12);

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        children: [
          Row(
            children: [
              Image(
                height: velicinaIkona,
                width: velicinaIkona,
                image: AssetImage("images/ikona-glavnoJelo.png"),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "- ${menu1.toString().replaceAll("[", "").replaceAll("]", "")}\n\n- ${menu2.toString().replaceAll("[", "").replaceAll("]", "")}\n\n- ${menu3.toString().replaceAll("[", "").replaceAll("]", "")}",
                  style: textStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: razmakVertikalno,
            child: divider,
          ),
          Row(
            children: [
              Image(
                height: velicinaIkona,
                width: velicinaIkona,
                image: AssetImage("images/ikona-vege.png"),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "- ${menuVege.toString().replaceAll("[", "").replaceAll("]", "")}",
                  style: textStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: razmakVertikalno,
            child: divider,
          ),
          Row(
            children: [
              Image(
                width: velicinaIkona,
                height: velicinaIkona,
                image: AssetImage("images/ikona-dodatno.png"),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "- ${menuDodatno[0]}\n- ${menuDodatno[1]}",
                  style: textStyle,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
