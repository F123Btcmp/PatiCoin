import 'package:flutter/material.dart';

class appBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const appBarCustom({Key? key, required this.title}) : super(key: key);
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: Colors.white.withOpacity(0.1), // Saydamlığı ayarlayın
        ),
        CustomPaint(
          size: size,
          painter: drawAppBar(),
        ),
        CustomPaint(
          size: size,
          painter: shadow1(),
        ),
        CustomPaint(
          size: size,
          painter: shadow2(),
        ),
        Positioned(
          top: size.height * 0.01,
          left: size.width * 0.3,
          child: Text(
            "$title",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          right: size.width * 0.014,
          top: size.height* 0.016,
          child: SizedBox(
            height: 25,
            width: 80,
            child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.currency_bitcoin),
                      Text(
                        "123",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ) ,
            ),
          ),
        ),
        Positioned(
          child:GestureDetector(
            onTap: () {
              print(size.width);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 40,
                width: 40,
                color: Colors.white.withOpacity(0.7),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 33,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class shadow1 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final width = size.width;
    final height = 60.0 ;

    Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.32)
      ..isAntiAlias = true
      ..style = PaintingStyle.fill ;
    Path myPath = Path();
    myPath.moveTo(width * 0.86, 0);
    var firststartpoint = Offset(width * 0.64, height/2.8);
    var firstendpoint =  Offset(width * 0.87, height - size.width * 0.0127);

    var secondStartPoint = Offset(width * 0.99 , height + height * 0.0833);
    var secondEndPoint = Offset(width , height /2);

    var thirdStartPoint = Offset(width , 0);
    var thirdEndPoint = Offset(width * 0.9 , 0);

    myPath.quadraticBezierTo(firststartpoint.dx, firststartpoint.dy, firstendpoint.dx, firstendpoint.dy);
    myPath.quadraticBezierTo(secondStartPoint.dx, secondStartPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    myPath.quadraticBezierTo(thirdStartPoint.dx, thirdStartPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

    myPath.lineTo(width * 50, 0);
    canvas.drawPath(myPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class shadow2 extends CustomPainter{ //arkadaki
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final width = size.width;
    final height = 60.0 ;

    Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.18)
      ..isAntiAlias = true
      ..style = PaintingStyle.fill ;
    Path myPath = Path();
    myPath.moveTo(width * 0.79, 0);
    var firststartpoint = Offset(width * 0.6, height/2.8);
    var firstendpoint =  Offset(width * 0.87, height - size.width * 0.0127);

    var secondStartPoint = Offset(width * 0.99 , height + height * 0.0833 );
    var secondEndPoint = Offset(width , height /2);

    var thirdStartPoint = Offset(width , 0);
    var thirdEndPoint = Offset(width * 0.9 , 0);

    myPath.quadraticBezierTo(firststartpoint.dx, firststartpoint.dy, firstendpoint.dx, firstendpoint.dy);
    myPath.quadraticBezierTo(secondStartPoint.dx, secondStartPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    myPath.quadraticBezierTo(thirdStartPoint.dx, thirdStartPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

    myPath.lineTo(width * 50, 0);
    canvas.drawPath(myPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class drawAppBar extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final width = size.width;
    final height = 60.0 ;
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Color(0xff8C5073)
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 15); // Burada gölgeyi ayarlayabilirsiniz.

    Path myPath = Path();
    myPath.moveTo(size.width * 0.14, 0);
    var firststartpoint = Offset(width * 0.2,height - height / 6 );
    var firstendpoint = Offset(width * 0.4,height- height/6);

    var secondstart = Offset(width * 0.3 + width * 0.2, height - height / 6 );
    var secondend = Offset(width * 0.6, height/1.8);

    var thirdstart = Offset(width * 0.7 , size.width * 0.056);
    var thirdend = Offset(width * 0.88 , height + height * 0.033 );

    var fourthstart = Offset(width * 0.97 , height + height * 0.25);
    var fourthend = Offset(width, height );

    myPath.quadraticBezierTo(firststartpoint.dx, firststartpoint.dy, firstendpoint.dx, firstendpoint.dy);
    myPath.quadraticBezierTo(secondstart.dx, secondstart.dy, secondend.dx, secondend.dy);
    myPath.quadraticBezierTo(thirdstart.dx, thirdstart.dy, thirdend.dx, thirdend.dy);
    myPath.quadraticBezierTo(fourthstart.dx, fourthstart.dy, fourthend.dx, fourthend.dy);

    myPath.lineTo(width * 50, 0);

    canvas.drawPath(myPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

