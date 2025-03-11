import 'package:descmovies/utils/text.dart';
import 'package:descmovies/widgets/top_rated.dart';
import 'package:descmovies/widgets/trending.dart';
//import 'package:descmovies/widgets/trending_movies.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:descmovies/widgets/tv.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {

    super.initState();
    loadMovie();
  }

  //list for stroring a trending movies
  List trendingmovies=[];
  //list for stroring a top-rated  movies
  List topratedmovies=[];
  //list for stroring a tv shows
  List tvshows=[];

  //apikey
  final String apikey='ab1f0227e9aebdd4ac934fe24d67cd1b';
  //accessing the api key
  final String readacess='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYjFmMDIyN2U5YWViZGQ0YWM5MzRmZTI0ZDY3Y2QxYiIsIm5iZiI6MTc0MTU4NTI3Ny4xNSwic3ViIjoiNjdjZTdiN2QzYzI1NDQ0ODgyZTJmZTI1Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.yB-2GyCvlZAeLrEZy_TvbBsJK_NN1mPPz46e5IFGVD0';


  //load trending movie function
  loadMovie()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey,readacess),logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ));

    //getting trending movies
    Map trendingresult=await tmdbWithCustomLogs.v3.trending.getTrending();
    //getting top rated
    Map topratedresult=await tmdbWithCustomLogs.v3.movies.getTopRated();
    //getting tv shows
    Map tvshowsresult=await tmdbWithCustomLogs.v3.tv.getPopular();


    //loading movies
    setState(() {
      //trendingmovies=trendingresult['results'];
      //topratedmovies=topratedresult['results'];
      tvshows=tvshowsresult['results'];
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(text: "Movies", color: Colors.black, size: 21),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(
        children: [
          TV(tv: tvshows),
          TrendingMovies(trending: trendingmovies),
          //Top_Rated(top_rated: topratedmovies)

        ],
      )
    );
  }
}