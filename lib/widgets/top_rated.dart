import 'package:descmovies/utils/text.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Top_Rated extends  StatelessWidget{

  final List top_rated;
  Top_Rated({Key? key,required this.top_rated}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ModifiedText(text: "Top Rated..", color: Colors.black45, size: 20),
              Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: top_rated.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){

                        },
                        child:Container(
                          height: 270,
                          width: 140,
                          child: Column(
                            children: [
                              //imagess container
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            top_rated[index]['poster_path']!=null? 'https://image.tmdb.org/t/p/w500' +
                                            top_rated[index]['poster_path']:"load_"
                                    ),
                                  ),
                                ),
                              ),

                              //names container
                              Container(
                                child: ModifiedText(text: top_rated[index]['title']!=null?top_rated[index]['title']:"Loading",
                                    color: Colors.white, size: 10),
                              )
                            ],
                          ),
                        ) ,
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