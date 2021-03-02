import 'package:flutter/material.dart';
import 'package:fastcode_design/shared/widgets/popular_game_card_widget.dart';

class PopularGameScroll extends StatelessWidget {
  const PopularGameScroll({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.0,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        itemBuilder: (BuildContext context, int index) {  
          return PopularGameCard();
        },
      ),
    );
  }

}