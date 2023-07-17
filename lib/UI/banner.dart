import 'package:flutter/material.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/pages/cam_page.dart';

class banner extends StatelessWidget {
  const banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => camPage()));
        },
        child: SizedBox(
          height: size.height * 0.13,
          child: Stack(
            children:[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: ColorConstants.pink2,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 2,
                      offset: Offset(0, 3)
                    )
                  ]
                ) ,
                child: Padding(
                  padding:  EdgeInsets.only(left: size.width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          textMod("Hayvanları Besle", 16, Colors.white),
                          textMod("Fotoğraf Çek", 16, Colors.white),
                          textMod("Coin Kazan", 16, Colors.white),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(4),
                              child: const textMod("Fotoğraf Çek!", 10, ColorConstants.pink2),
                            ),
                          ),
                          SizedBox(height: 5),
                          textMod("10+ Gönderi", 8, Colors.white),
                        ],
                      ),
                      SizedBox(width: size.width * 0.2),
                    ],
                  ),
                ),
              ),
              CustomPaint(
                size: size,
                painter: shadowBanner(),
              ),
              CustomPaint(
                size: size,
                painter: shadowBanner2(),
              ),
              Positioned(
                top: size.height* 0.015,
                right: size.width * 0.03,
                child: Image.asset(
                  "assets/image/dog 1.png"
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
class shadowBanner extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..isAntiAlias = true
      ..style = PaintingStyle.fill ;

    Path myPath = Path();
    myPath.moveTo(size.width * 0.85, 0);

    var firststartpoint = Offset(size.width * 0.58, size.height / 2); // eğim
    var firstendpoint =  Offset(size.width * 0.89 , size.height ); //son nokta

    var secondstartpoint = Offset(size.width * 0.95 , size.height );
    var secondendpoint = Offset(size.width  , size.height  );

    myPath.quadraticBezierTo(firststartpoint.dx, firststartpoint.dy, firstendpoint.dx, firstendpoint.dy);
    myPath.quadraticBezierTo(secondstartpoint.dx, secondstartpoint.dy, secondendpoint.dx, secondendpoint.dy);


    myPath.lineTo(size.width, 0);
    canvas.drawPath(myPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
class shadowBanner2 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..isAntiAlias = true
      ..style = PaintingStyle.fill ;

    Path myPath = Path();
    myPath.moveTo(size.width * 0.8, 0);

    var firststartpoint = Offset(size.width * 0.5, size.height / 2); // eğim
    var firstendpoint =  Offset(size.width * 0.85 , size.height ); //son nokta

    var secondstartpoint = Offset(size.width * 0.95 , size.height );
    var secondendpoint = Offset(size.width  , size.height  );

    myPath.quadraticBezierTo(firststartpoint.dx, firststartpoint.dy, firstendpoint.dx, firstendpoint.dy);
    myPath.quadraticBezierTo(secondstartpoint.dx, secondstartpoint.dy, secondendpoint.dx, secondendpoint.dy);


    myPath.lineTo(size.width, 0);
    canvas.drawPath(myPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
