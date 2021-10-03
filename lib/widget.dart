import 'package:flutter/material.dart';
import 'home screen.dart';


class movielist extends StatefulWidget {
  final movieinfo movie;
  final int value;
  movielist({required this.movie ,required this.value});

  @override
  _movielistState createState() => _movielistState();
}

class _movielistState extends State<movielist> {


  @override
  Widget build(BuildContext context) {
    final String director = widget.movie.director;
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 18),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.network(widget.movie.image),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 18, right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text(widget.movie.name, style: TextStyle(color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Director: $director", style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),),
                  SizedBox(height: 50,),
                  InkWell(
                    onTap: () {
                      setState(() {

                      });
                      movielistss.removeAt(widget.value);
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Delete", style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),)),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
