import 'package:flutter/material.dart';
import 'package:fastcode_design/shared/widgets/popular_game_card_widget.dart';

class PopularGameScroll extends StatelessWidget {

  final List<Map<String, dynamic>> popularGames;

  const PopularGameScroll({
    Key key,
    @required this.popularGames
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.0,
      child: ListView.builder(
        itemCount: popularGames.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        itemBuilder: (BuildContext context, int index) {  
          return PopularGameCard(
            popularGame: popularGames[index],
          );
        },
      ),
    );
  }

}