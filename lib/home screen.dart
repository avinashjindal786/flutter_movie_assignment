import 'package:flutter/material.dart';

import 'widget.dart';

List<movieinfo> movielistss = [
  movieinfo(name: "alpha", image: 'https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/1800/star.jpg', director: 'dnsmnnmas')
];

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  TextEditingController link = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController directorss = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Movie"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.add,color: Colors.blue,),
          backgroundColor: Colors.white,
          onPressed: (){
            showModalBottomSheet(context: context,
                isScrollControlled: true,
                builder: (context)
            {
             return Padding(
               padding: MediaQuery.of(context).viewInsets,
               child: Container(
                 height: 420,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 28,top: 18),
                       child: Text("Poster link",style: TextStyle(color: Color(0xFF505050),fontWeight: FontWeight.w600,fontSize: 15 ),),
                     ),
                     SizedBox(height: 8,),
                     Center(
                       child: Container(
                         width: 320,
                         height: 50,
                         decoration: BoxDecoration(
                           //color: Color(0xFFC4EBEF),
                           borderRadius: BorderRadius.circular(5),
                           border: Border.all(color: Color(0xFFFF7B7B),width: 2)

                         ),
                         child: TextField(
                            controller: link,
                           cursorColor: Colors.black,
                           keyboardType: TextInputType.text,
                           decoration: new InputDecoration(
                               border: InputBorder.none,
                               focusedBorder: InputBorder.none,
                               enabledBorder: InputBorder.none,
                               errorBorder: InputBorder.none,
                               disabledBorder: InputBorder.none,
                               contentPadding:
                               EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                               hintText: "link"),
                         ),
                       ),
                     ),
                     SizedBox(height: 18,),
                     Padding(
                       padding: const EdgeInsets.only(left: 28),
                       child: Text("Movie Name",style: TextStyle(color: Color(0xFF505050),fontWeight: FontWeight.w600,fontSize: 15 ),),
                     ),
                     SizedBox(height: 8,),
                     Center(
                       child: Container(
                         width: 320,
                         height: 50,
                         decoration: BoxDecoration(
                           //color: Color(0xFFC4EBEF),
                             borderRadius: BorderRadius.circular(5),
                             border: Border.all(color: Color(0xFFFF7B7B),width: 2)

                         ),
                         child: TextField(
                           controller: name,
                           cursorColor: Colors.black,
                           keyboardType: TextInputType.text,
                           decoration: new InputDecoration(
                               border: InputBorder.none,
                               focusedBorder: InputBorder.none,
                               enabledBorder: InputBorder.none,
                               errorBorder: InputBorder.none,
                               disabledBorder: InputBorder.none,
                               contentPadding:
                               EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                               hintText: "Name"),
                         ),
                       ),
                     ),
                     SizedBox(height: 18,),
                     Padding(
                       padding: const EdgeInsets.only(left: 28),
                       child: Text("Movie Director",style: TextStyle(color: Color(0xFF505050),fontWeight: FontWeight.w600,fontSize: 15 ),),
                     ),
                     SizedBox(height: 8,),
                     Center(
                       child: Container(
                         width: 320,
                         height: 50,
                         decoration: BoxDecoration(
                           //color: Color(0xFFC4EBEF),
                             borderRadius: BorderRadius.circular(5),
                             border: Border.all(color: Color(0xFFFF7B7B),width: 2)

                         ),
                         child: TextField(
                           controller: directorss,

                           cursorColor: Colors.black,
                           keyboardType: TextInputType.text,
                           decoration: new InputDecoration(
                               border: InputBorder.none,
                               focusedBorder: InputBorder.none,
                               enabledBorder: InputBorder.none,
                               errorBorder: InputBorder.none,
                               disabledBorder: InputBorder.none,
                               contentPadding:
                               EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                               hintText: "Director"),
                         ),
                       ),
                     ),
                     SizedBox(height: 28,),
                     InkWell(

                       child: Padding(
                         padding: const EdgeInsets.all(18.0),
                         child: Container(
                           height: 60,

                           decoration: BoxDecoration(
                             color: Colors.blue,
                             borderRadius: BorderRadius.circular(10),
                           ),
                           child: Center(child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),)),
                         ),
                       ),
                       onTap: ()
                       {

                         setState(() {
                           if(link.text != "")
                             {
                               movielistss.add(movieinfo(name: name.text, image: link.text, director: directorss.text));
                             }
                           else{

                           }


                           name.text = "";
                           link.text = "";
                           directorss.text = "";
                         });
                       },
                     )
                   ],
                 ),

               ),
             ) ;
            });
          }
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                  itemCount: movielistss.length,
                  itemBuilder: (_,index)
              {
                return movielist(movie: movielistss[index],value: index,);
              }),
            ),
          ),
        ],
      ),
    );
  }
}




class movieinfo
{
  String image;
  String name;
  String director;
  movieinfo({required this.name, required this.image,required this.director});
}