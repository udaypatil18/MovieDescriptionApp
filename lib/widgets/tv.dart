import 'package:descmovies/description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/text.dart';

class TV extends StatelessWidget{
  final List tv;

  const TV({Key? key,required this.tv}):super(key: key);
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Padding(padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModifiedText(text: "TV shows", color: Colors.white, size: 31),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      //open description window ontap
                      onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Desc_Movie(
                          //   name: tv[index]['original_name'],
                          //   description:tv[index]['overview'] ,
                          //   bannerUrl: 'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                          //   posterUrl: 'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'],
                          //   launchOn: tv[index]['release_date'],
                          //   voting: tv[index]['vote_average'].toString(),
                          // )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 300,
                        height: 300,
                        child: Column(
                          children: [
                            Container(
                              height:200,
                              width: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path']!=null?'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path']:"loading",

                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),

                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: ModifiedText(text: tv[index]['original_name']!=null?tv[index]['original_name']:"loading",
                                  color: Colors.white,
                                  size: 20),
                            )
                          ],
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