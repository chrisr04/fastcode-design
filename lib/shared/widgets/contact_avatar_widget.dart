import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class ContactAvatar extends StatelessWidget {

  final Map<String, dynamic> contact;

  const ContactAvatar({
    Key key,
    @required this.contact
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int stories = contact['stories'];
    double space = (stories>1 && stories <= 45)? 5.0 : (stories > 45)? 2.0 : 0.0;
    double quantStories = ((2*pi*35)-stories*space)/stories;

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
            color: (contact['viewed'])? Colors.grey[400] : Colors.greenAccent[700],
            dashPattern: [quantStories, space], 
            radius: Radius.circular(30.0),
            strokeWidth: 2.5,
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              maxRadius: 30.0,
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage(contact['photo']),
            ),
          ),
          SizedBox(height: 15.0),
          Text(contact['name'], style: TextStyle( color: Colors.grey[600], fontSize: 15.0),)
        ],
      )
    );
  }
}