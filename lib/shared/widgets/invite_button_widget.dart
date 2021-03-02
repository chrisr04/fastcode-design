import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class InviteButton extends StatelessWidget {
  
  const InviteButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DottedBorder(
            borderType: BorderType.Circle,
            strokeCap: StrokeCap.round,            
            color: Colors.transparent,
            radius: Radius.circular(30.0),
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              maxRadius: 30.0,
              backgroundColor: Colors.black,
              child: Icon(Icons.person_add_alt_1_rounded, size: 32.0, color: Colors.white)
            ),
          ),
          SizedBox(height: 15.0),
          Text('Invite', style: TextStyle( color: Colors.black, fontSize: 15.0))
        ],
      )
    );
  }
}