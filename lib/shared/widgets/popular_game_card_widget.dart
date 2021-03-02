import 'package:flutter/material.dart';

class PopularGameCard extends StatelessWidget {
  const PopularGameCard({Key key}) : super(key: key);

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
          _favoriteIcon(),

          
        ],
      ),
    );
  }

  Widget _background(){
    return Container(
      width: 160.0,
      height: 230.0,
      child: CustomPaint(
        painter: SquarePainter(
          color: Colors.cyanAccent[400]
        ),
      ),
    );
  }

  Widget _favoriteIcon(){

    return Positioned(
      top: 55.0,
      left: 12.0,
      child: Icon(Icons.favorite_outline, color: Colors.white, size: 24.0,)
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
          width: 130.0,
          image: NetworkImage('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e51a59cc-7d6f-435a-be4f-20c3dd00a628/d7gzs7a-8ca34ed7-5842-4a98-a275-7d5d55d2d3df.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvZTUxYTU5Y2MtN2Q2Zi00MzVhLWJlNGYtMjBjM2RkMDBhNjI4XC9kN2d6czdhLThjYTM0ZWQ3LTU4NDItNGE5OC1hMjc1LTdkNWQ1NWQyZDNkZi5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.NzyrrtifLb15OLkVJhaWFMCLaRMPnumM7dEc-1l7Ugw'),
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
                Text('Jetpack Joy', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 3.0),
                Text('Action Packed', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 13.0))
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
            child: Text('4.9', style: TextStyle(color: Colors.cyanAccent[400], fontWeight: FontWeight.bold))
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

    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.07, size.height * 0.15, size.width * 0.37, size.height * 0.23);
    path.lineTo(size.width * 0.9, size.height * 0.357);
    path.quadraticBezierTo(size.width *0.985 , size.height * 0.38, size.width, size.height * 0.47);
    path.lineTo(size.width, size.height * 0.88);
    path.quadraticBezierTo(size.width *0.96, size.height , size.width *0.8, size.height);
    path.lineTo(size.width *0.2, size.height);
    path.quadraticBezierTo(size.width *0.05 , size.height , 0, size.height * 0.88);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}