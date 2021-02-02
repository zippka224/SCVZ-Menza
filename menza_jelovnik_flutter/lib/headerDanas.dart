import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'headerBackground.dart';

class HeaderDanas extends StatelessWidget {
  const HeaderDanas({
    Key key,
    @required this.dan,
    @required this.datum,
  }) : super(key: key);

  final dan;
  final datum;

  @override
  Widget build(BuildContext context) {
    final shadows = [
      Shadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        offset: Offset(0.0, 1.5),
      ),
    ];
    return ClipPath(
      clipper: HeaderBackgroundShape(),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 2, 153, 255),
        ),
        height: 140,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            15,
            10,
            34,
            10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          dan,
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: shadows,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        datum,
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                              shadows: shadows,
                              letterSpacing: 3.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Image(
                height: 77,
                width: 77,
                image: AssetImage("images/restoran_ikona.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
