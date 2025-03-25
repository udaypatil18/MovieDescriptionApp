import 'package:descmovies/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../description.dart';

class TrendingMovies extends StatelessWidget{

  List trending;

  //constructor
  TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ModifiedText(text: "Trending Movies", color: Colors.white70, size: 31),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 270,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                    itemCount: trending.length,
                    itemBuilder: (context,index){
                      return Material(
                        child: InkWell(

                          //go to description page
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Desc_Movie(
                              name: trending[index]['original_name'].toString()!=null?trending[index]['title'].toString():"load",
                              description:trending[index]['overview'].toString()!=null?trending[index]['overview'].toString():"load",
                              bannerUrl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                              posterUrl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                              launchOn: trending[index]['release_date'].toString()!=null?trending[index]['release_date'].toString():"load",
                              voting: trending[index]['vote_average'].toString()!=null?trending[index]['vote_average'].toString():"load",
                            )));
                          },
                          child: Container(
                            width: 140,
                            child: Column(
                              children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']!=null?"'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']":"loaddd"
                                           // 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']!=null?'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']:"loading"
                                        ),
                                      ),
                                    ),
                                  ),
                        
                                Container(
                                  child: ModifiedText(text: trending[index]['title']!=null?trending[index]['title']:"loading",
                                      color: Colors.white70,
                                      size: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
      ),

    );

  }

}