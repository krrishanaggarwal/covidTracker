import 'package:corona_version2/datasourcefile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Grids extends StatelessWidget {
  final String text;
  final Widget route;
  final int imageIndex;

  Grids({this.text, this.route, this.imageIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      // margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            color: Colors.blue[50],
            elevation: 6,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => route,
                          ));
                    },
                    child: SvgPicture.asset(DataSource.dashButtons[imageIndex]),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
