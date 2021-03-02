import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLe5PABjXc17cjIMOibECLM7ppDwMmiDg6Dw&usqp=CAU'),
              fit: BoxFit.cover
            ),
            boxShadow:[ 
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0,2),
                blurRadius: 6.0
              )
            ]
          ),
        ),
        Positioned(
          top: -4.0,
          right: -4.0,
          child: Container(
            width: 16.0,
            height: 16.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 3.2, color: Colors.green[600]),
              borderRadius: BorderRadius.circular(15.0)
            ),
          )
        )
      ],
    );
  }
}


