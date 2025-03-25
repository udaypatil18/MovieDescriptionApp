import 'package:descmovies/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Desc_Movie extends StatelessWidget{

  final String name,description,bannerUrl,posterUrl,launchOn,voting;

  const Desc_Movie({Key? key,required this.name,required this.description,required this.bannerUrl,
  required this.posterUrl,required this.launchOn,required this.voting}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  //child for poster
                  Positioned(
                      child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                        child: Image.network(bannerUrl,),
                    )
                  ),

                  //child for rating
                  Positioned(
                    bottom: 10,
                      child: ModifiedText(text: "Rating : "+voting, color: Colors.black, size: 20)
                  ),
                ],
              ),

            ),
            SizedBox(
              height: 20,
            ),

            //comtainerr for movie name
            Container(
              padding: EdgeInsets.all(20),
              child: ModifiedText(text: name.toString()!=null?name.toString():"404", color: Colors.white70, size: 24),
            ),

            //container for launch date
            Container(
              padding: EdgeInsets.all(20),
              child: ModifiedText(text: "Released On ->"+launchOn, color: Colors.white70, size: 25),
            ),

            Row(
              children: [

                //container for poster
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: 100,
                  child: Image.network(posterUrl),
                ),

                //container for description
                Flexible(
                  child: Container(
                    child: ModifiedText(text: description, color: Colors.white70, size: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}