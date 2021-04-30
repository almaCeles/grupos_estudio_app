import 'package:flutter/material.dart';

class Design extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Opacity(
          opacity: 0.7,
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

    paint.color = Colors.indigo[900];
    paint.style = PaintingStyle
        .fill; // .stroke es para dibujar una linea y  .fill es para pintar todo
    paint.strokeWidth = 10.5; //tañamo del pincel

    final path = new Path();

    /*
    (0,0)-(0,size.heigth)-(size.width,size.heigth)-(size.width,0)
     */

    path.lineTo(0, size.height * 0.23);

    path.quadraticBezierTo(size.width * 0.20, size.height * 0.09,
        size.width * 0.7, size.height * 0.10);
    path.quadraticBezierTo(
        size.width * 0.90, size.height * 0.10, size.width, size.height * 0.11);
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

    paint.color = Colors.indigo[900];
    paint.style = PaintingStyle
        .fill; // .stroke es para dibujar una linea y  .fill es para pintar todo
    paint.strokeWidth = 10.5; //tañamo del pincel

    final path = new Path();

    /*
    (0,0)-(0,size.heigth)-(size.width,size.heigth)-(size.width,0)
     */

   path.lineTo(0, size.height * 0.15);

    path.quadraticBezierTo(size.width * 0.20, size.height * 0.09,
        size.width * 0.4, size.height * 0.08);
    path.quadraticBezierTo(
        size.width * 0.90, size.height * 0.08, size.width, size.height * 0.10);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint); //esto es lo que permite que se dibuje todo
  }

