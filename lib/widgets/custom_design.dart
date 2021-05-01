import 'package:flutter/material.dart';

import 'Button_Inicio.dart';
  Widget appBaner(BuildContext context){
     return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 27.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya.jpg'),
                        radius: 20.0,
                        backgroundColor: Colors.yellow[400],
                      ),
                    ),
                   Text('Nombre Apeido ' ,textAlign: TextAlign.center , style: TextStyle(color: Colors.red[300], fontSize: 25),)
                    
                        ],
                      )
                      ,
                    bnBaner(context)
                 ],
               );
  }
  Widget uno(BuildContext context) {
    return Opacity(
          opacity: 1.0,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: CustomPaint(
              painter: FondoPaint1(),
            ),
          ),
        );
  }

  Widget dos(BuildContext context) {
    return Opacity(
          opacity: 1.0,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: CustomPaint(
              painter: FondoPaint2(),
            ),
          ),
        );
  }

class FondoPaint1 extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    curva2(canvas, size);
  }
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
  
  
}
  void curva2(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color.fromRGBO(69, 79, 95, 1);
    paint.style = PaintingStyle
        .fill; // .stroke es para dibujar una linea y  .fill es para pintar todo
    paint.strokeWidth = 10.5; //tañamo del pincel

    final path = new Path();

    /*
    (0,0)-(0,size.heigth)-(size.width,size.heigth)-(size.width,0)
     */

    path.lineTo(0, size.height * 0.24);

    path.quadraticBezierTo(
        size.width * 0.15, size.height * 0.16,
        size.width * 0.60, size.height * 0.13 );
    path.quadraticBezierTo(
        size.width * 0.80, size.height * 0.12, 
        size.width, size.height * 0.15);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint); //esto es lo que permite que se dibuje todo
  }

class FondoPaint2 extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    curva3(canvas, size);
  }
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
  
  
}
  void curva3(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color.fromRGBO(91, 114, 152, 1.0);
    paint.style = PaintingStyle.fill; // .stroke es para dibujar una linea y  .fill es para pintar todo
    paint.strokeWidth = 10.5; //tañamo del pincel

    final path = new Path();

    /*
    (0,0)-(0,size.heigth)-(size.width,size.heigth)-(size.width,0)
     */

   path.lineTo(0, size.height * 0.30);

    path.quadraticBezierTo(
        size.width * 0.15, size.height * 0.20,
        size.width * 0.60, size.height * 0.15 );
    path.quadraticBezierTo(
        size.width * 0.80, size.height * 0.13, 
        size.width, size.height * 0.15);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint); //esto es lo que permite que se dibuje todo
  }

