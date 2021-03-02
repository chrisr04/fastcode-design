import 'package:fastcode_design/shared/helpers/color_helper.dart';
import 'package:flutter/material.dart';

class PopularGameCard extends StatelessWidget {

  final Map<String, dynamic> popularGame;

  const PopularGameCard({
    Key key,
    @required this.popularGame
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      height: 230.0,
      margin: EdgeInsets.only(right: 17.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: Stack(
        overflow: Overflow.clip,
        children: [
          _background(),
          _bodyCard(),
          _favoriteIcon()
        ],
      ),
    );
  }

  Widget _background(){
    return Container(
      width: 160.0,
      height: 230.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: CustomPaint(
        painter: SquarePainter(
          color: getColor(popularGame['color']),
        ),
      ),
    );
  }

  Widget _favoriteIcon(){

    return Positioned(
      top: 55.0,
      left: 12.0,
      child: Icon((popularGame['favorite'])? Icons.favorite : Icons.favorite_outline, color: Colors.white, size: 24.0,)
    );
  }

  Widget _bodyCard(){

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _bodyCardImage(),
        _bodyCardInfo()
      ],
    );
  }

  Widget _bodyCardImage(){
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 12.0, top: 20.0, bottom: 5.0),
        child: Image(
          height: 140.0,
          image: NetworkImage(popularGame['image']),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _bodyCardInfo(){
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(popularGame['title'], style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 3.0),
                Text(popularGame['subtitle'], maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 13.0))
              ],
            ),
          ),
        ),
        SizedBox(width: 3.0),
        Container(
          width: 30.0,
          height: 30.0,
          margin: EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0)
          ),
          child: Center(
            child: Text('${popularGame['rating']}', style: TextStyle(color: getColor(popularGame['color']), fontWeight: FontWeight.bold))
          ),
        )
      ],
    );
  }

}

class SquarePainter extends CustomPainter {

  final Color color;
  SquarePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
          ..color = color;

    Path path = Path();

    path.moveTo(0, size.height*0.3);
    path.quadraticBezierTo(size.width*0.06, size.height*0.14, size.width*0.35, size.height*0.22);
    path.lineTo(size.width*0.9, size.height*0.375);
    path.quadraticBezierTo(size.width*0.985 , size.height*0.4, size.width, size.height*0.47);
    path.lineTo(size.width, size.height*0.88);
    path.quadraticBezierTo(size.width*0.96, size.height , size.width*0.8, size.height);
    path.lineTo(size.width*0.2, size.height);
    path.quadraticBezierTo(size.width*0.05 , size.height , 0, size.height*0.88);
    
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}