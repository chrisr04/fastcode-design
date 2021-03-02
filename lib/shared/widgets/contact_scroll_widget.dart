import 'package:fastcode_design/shared/widgets/contact_avatar_widget.dart';
import 'package:fastcode_design/shared/widgets/invite_button_widget.dart';
import 'package:flutter/material.dart';
class ContactScroll extends StatelessWidget {

  final List<Map<String, dynamic>> contacts;

  const ContactScroll({
    Key key, 
    @required this.contacts
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: ListView.builder(
        itemCount: contacts.length+1,
        padding: EdgeInsets.symmetric(horizontal: 5.0),
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
      return ContactAvatar(
        contact: contacts[index-1],
      );
    }
  }
}