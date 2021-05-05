import 'package:flutter/material.dart';

class MensajesPropios extends StatelessWidget {
  const MensajesPropios({Key key, this.message, this.date}) : super(key: key);
  final String message;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 80, top: 10, bottom: 20),
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 2,
                    right: 10,
                    child: Row(
                      children: [
                        Text(
                          date,
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        Icon(
                          Icons.done_all,
                          size: 20,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
