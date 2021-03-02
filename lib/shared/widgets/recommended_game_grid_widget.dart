import 'package:fastcode_design/shared/widgets/recommended_game_card_widget.dart';
import 'package:flutter/material.dart';

class RecommendedGrid extends StatelessWidget {

  final List<Map<String, dynamic>> recommendedGames;
  
  const RecommendedGrid({
    Key key,
    @required this.recommendedGames
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.95,
          crossAxisSpacing: 17.0,
          mainAxisSpacing: 5.0
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 25.0, right: 25.0),
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index){
          return RecommendedGameCard(
            recommendedGame: recommendedGames[index],
          );
        },
      ),
    );
  }

}