import 'package:fastcode_design/shared/widgets/contact_avatar_widget.dart';
import 'package:fastcode_design/shared/widgets/invite_button_widget.dart';
import 'package:flutter/material.dart';
class ContactScroll extends StatelessWidget {
  const ContactScroll({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {  
          return _avatar(index);
        }
      ),
    );
  }

  Widget _avatar(int index){
    if(index == 0){
      return InviteButton();
    }else{
      return ContactAvatar();
    }
  }
}