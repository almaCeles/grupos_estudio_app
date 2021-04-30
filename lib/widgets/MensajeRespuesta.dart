import 'package:flutter/material.dart';

class MensajeRespuesta extends StatelessWidget {
  const MensajeRespuesta({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Color(0xffADB5CE),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 80, top: 10, bottom: 20),
                  child: Text(
                    "hey",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Positioned(
                    bottom: 2,
                    right: 10,
                    child: Row(
                      children: [
                        Text(
                          "20:48",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
