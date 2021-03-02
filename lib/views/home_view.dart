import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fastcode_design/shared/widgets/loader_widget.dart';
import 'package:fastcode_design/shared/widgets/user_avatar_widget.dart';
import 'package:fastcode_design/shared/widgets/contact_scroll_widget.dart';
import 'package:fastcode_design/shared/widgets/popular_game_scroll_widget.dart';
import 'package:fastcode_design/shared/widgets/recommended_game_grid_widget.dart';

class HomeView extends StatefulWidget {

  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  Future<String> contactsFuture;
  Future<String> popularFuture;
  Future<String> recommendedFuture;
  List<Map<String, dynamic>> contacts;
  List<Map<String, dynamic>> popularGames;
  List<Map<String, dynamic>> recommendedGames;

  @override
  void initState() {
    contactsFuture = DefaultAssetBundle.of(context).loadString("assets/data/contacts.json");
    popularFuture = DefaultAssetBundle.of(context).loadString("assets/data/popular.json");
    recommendedFuture = DefaultAssetBundle.of(context).loadString("assets/data/recommended.json");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100.0),
        child: _init(),
      ),
    );
  }

  Widget _init(){

    return FutureBuilder(
      future: Future.wait([contactsFuture, popularFuture, recommendedFuture]),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {

        if(snapshot.hasData){

          contacts = json.decode(snapshot.data[0]).cast<Map<String, dynamic>>();
          popularGames = json.decode(snapshot.data[1]).cast<Map<String, dynamic>>();
          recommendedGames = json.decode(snapshot.data[2]).cast<Map<String, dynamic>>();

          return SafeArea(
            child: Column(
              children: [
                _header(),
                _contactScroll(),
                _releaseTitle(),
                _popularTitle(),
                _scrollPopularGames(),
                _recommendedTitle(),
                _recommendedGrid()
              ],
            ),
          );  
        }else{
          return Center(
            child: Loader(
              size: 35.0,
              primaryColor: Colors.black,
              secondaryColor: Colors.white,
            ),
          );
        }
      },
    );
  }

  Widget _header(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _greeting(),
          UserAvatar()
        ],
      ),
    );
  }

  Widget _greeting(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hi Nevil,', style: TextStyle(color: Colors.grey[600], fontSize: 17.0)),
        SizedBox(height: 5.0),
        Text('Welcome Back!', style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold))
      ],
    );
  }

  Widget _contactScroll(){
    return ContactScroll(
      contacts: contacts,
    );
  }

  Widget _releaseTitle(){
    return Container(
      margin: EdgeInsets.only(top: 25.0, left: 25.0),
      alignment: Alignment.centerLeft,
      child: Text('Recently Releassed', style: TextStyle(color: Colors.grey[600], fontSize: 13.0)),
    );
  }

  Widget _popularTitle(){
    return Container(
      margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0, bottom: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Popular Games', style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold)),
          Text('View All',style: TextStyle(color: Colors.black, fontSize: 13.0, decoration: TextDecoration.underline)),
        ],
      ),
    );
  }

  Widget _scrollPopularGames(){

    return PopularGameScroll(
      popularGames: popularGames,
    );
  }

  Widget _recommendedTitle(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Recommended Games', style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold)),
          Text('View All',style: TextStyle(color: Colors.black, fontSize: 13.0, decoration: TextDecoration.underline)),
        ],
      ),
    );
  }

  Widget _recommendedGrid(){
    return RecommendedGrid(
      recommendedGames: recommendedGames,
    );
  }

}

