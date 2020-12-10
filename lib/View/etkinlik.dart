import 'package:flutter/material.dart';
import 'package:flutter_app_homeone/View/addfavs.dart';
import 'package:flutter_app_homeone/View/yorumlar.dart';

class Etkinlik extends StatefulWidget {
  final String Image;

  const Etkinlik({Key key, this.Image}) : super(key: key);

  @override
  _EtkinlikState createState() => _EtkinlikState();
}

class _EtkinlikState extends State<Etkinlik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: 'red',
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.Image),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap:(){ Navigator.pop(context);
                            },
                      child: Container(
                        child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                      ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Mekan İsmi: ",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(height: 20),
                        Text("Etkinlik Tarihi: ",style: TextStyle(color: Colors.black,fontSize: 20),),
                        SizedBox(height: 10),
                        Text("Etkinlik Saati: ",style: TextStyle(color: Colors.black,fontSize: 20),),
                        SizedBox(height: 10),
                        Text("Mekan İsmi: ",style: TextStyle(color: Colors.black,fontSize: 30),),
                        SizedBox(height: 94),
                        Column(
                          children: <Widget>[
                            Container(
                              height: 45,
                              child: RaisedButton(
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                                color: Colors.red,
                                child: Text("Etkinliği Favorilerine Ekleyenler",),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => addfavs()),
                                ),
                              ),


                            ),
                            SizedBox(height: 10,),

                            Row(
                              children: [
                                Container(
                                  width: 150,
                                  height: 50,
                                  margin: EdgeInsets.only(right:20),
                                  child: RaisedButton(
                                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                                    color: Colors.red,
                                    child: Text("Mekanı Ara",),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => addfavs()),
                                    ),
                                    ),
                                ),





                                Container(
                                  width: 150,
                                  height: 50,
                                  child: RaisedButton(
                                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                    color: Colors.red,
                                    child: Text("Yorumlar",),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => yorumlar()),
                                    ),



                                    ),
                                ),

                              ],
                            ),

                          ],

                        ),
                      ],
                    )
                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
