import 'package:flutter/material.dart';

class GetRucakDanas {
  var jelovnik;
  Map rucak;
  GetRucakDanas({this.jelovnik}) {
    rucak = jelovnik["RUCAK"];
  }

  Set<String> get juheDanas {
    List<String> juheList = [];
    Set<String> juheSet;
    rucak.forEach((key, value) {
      switch (key) {
        case "1":
          {
            juheList.add(value[0]);
          }
          break;
        case "2":
          {
            juheList.add(value[0]);
          }
          break;
        case "3":
          {
            juheList.add(value[0]);
          }
          break;
        case "VEGE":
          {
            juheList.add(value[0]);
          }
          break;
      }
    });
    juheSet = juheList.toSet();
    return juheSet;
  }

  List<String> get menu1 {
    List _menu1 = rucak["1"];
    List<String> _menu1String = [];
    _menu1.forEach((element) {
      _menu1String.add(element);
    });
    _menu1String.removeAt(0);
    return _menu1String;
  }

  List<String> get menu2 {
    List _menu2 = rucak["2"];
    List<String> _menu2String = [];
    _menu2.forEach((element) {
      _menu2String.add(element);
    });
    _menu2String.removeAt(0);
    return _menu2String;
  }

  List<String> get menu3 {
    List _menu3 = rucak["3"];
    List<String> _menu3String = [];
    _menu3.forEach((element) {
      _menu3String.add(element);
    });
    _menu3String.removeAt(0);
    return _menu3String;
  }

  List<String> get menuVege {
    List _menuVege = rucak["VEGE"];
    List<String> _menuVegeString = [];
    _menuVege.forEach((element) {
      _menuVegeString.add(element);
    });
    _menuVegeString.removeAt(0);
    return _menuVegeString;
  }

  List<String> get menuDodatno {
    List _menuDodatno = rucak["DODATNO"];
    List<String> _menuDodatnoString = [];
    _menuDodatno.forEach((element) {
      _menuDodatnoString.add(element);
    });

    return _menuDodatnoString;
  }
}

class RucakDanas extends StatelessWidget {
  final Set<String> juhe;
  final List<String> menu1;
  final List<String> menu2;
  final List<String> menu3;
  final List<String> menuVege;
  final List<String> menuDodatno;
  RucakDanas(
      {this.juhe,
      this.menu1,
      this.menu2,
      this.menuVege,
      this.menuDodatno,
      this.menu3});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.normal);
    double razmakVertikalno = 45;
    double velicinaIkona = 60;
    Divider divider = Divider(thickness: 4.0, color: Colors.black12);

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                height: velicinaIkona,
                width: velicinaIkona,
                image: AssetImage("images/ikona-juhe.png"),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "- ${juhe.elementAt(0)}\n- ${juhe.elementAt(1)}",
                style: textStyle,
              )
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
