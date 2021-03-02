import 'package:flutter/material.dart';

class RecommendedGameCard extends StatelessWidget {
  const RecommendedGameCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25.0),
        image: DecorationImage(
          image: NetworkImage('http://pic.youmobile.org/img/asphalt7-logo.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                begin: FractionalOffset(0.59, 0.1),
                end: FractionalOffset(0.59, 0.4),
                colors: [
                  Colors.black,
                  Colors.transparent
                ]
              )
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Road Fight', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 19.0)),
                SizedBox(height: 5.0),
                Text('Shooting Cars', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 13.0))
              ]
            ),
          )
        ]
      ),
    );
  }
}