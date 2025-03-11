import 'package:descmovies/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

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
            children: [
              ModifiedText(text: "Trending Movies", color: Colors.white70, size: 21),
              Container(
                height: 270,
                width: 140,
                child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                    itemCount: trending.length,
                    itemBuilder: (context,index){
                      return Material(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            width: 140,
                            child: Column(
                              children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500' +
                                                trending[index]['poster_path']),
                                      ),
                                    ),
                                  ),
                        
                                Container(
                                  child: ModifiedText(text: trending[index]['title']!=null?trending[index]['title']:"loading",
                                      color: Colors.black45,
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