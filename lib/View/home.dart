import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_homeone/View/etkinlik.dart';
import 'package:flutter_app_homeone/View/profile.dart';
import 'package:flutter_app_homeone/View/settings.dart';
import 'package:flutter_app_homeone/View/bottom_nav_bar.dart';
import 'dart:ui'as ui;
import 'Time.dart';
import 'drawer_screen.dart';


void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: bottomNavBar()));

class HomePage extends StatelessWidget {
  int _currentIndex = 0;
  final List<Widget> _children = [];
  Time time = new Time();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),

              Container(
                height: 40,
                child: Row(

                  children: <Widget>[

                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            child: Text(
                              time.main(),
                              style: TextStyle(fontSize: 20),

                            ),
                            padding: EdgeInsets.all(5),
                          ),



                        ],



                      ),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    FloatingActionButton(
                      child: Icon(Icons.person),
                      elevation: 10,
                      backgroundColor: Colors.red,

                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profile()),

                      ),

                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              makeItem(
                  Image: 'assets/images/etkinlik.png',
                  tag: 'red',
                  context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({Image, tag, context}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Etkinlik(
                    Image: Image,
                  )));
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(Image),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Text(

                              'Etkinlik Adı',
                              style: TextStyle(
                                  fontSize: 40,
                                  foreground: Paint()

                                    ..shader = ui.Gradient.linear(
                                      const Offset(20, 0),
                                      const Offset(200, 0),

                                      <Color>[
                                        Colors.orange,
                                        Colors.purpleAccent,
                                      ],
                                    )
                              ),
                            ),

                            // Solid text as fill.

                          ],
                        ),
                        SizedBox(
                          height: 130,
                        ),
                        Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Text(
                              'Cage',
                              style: TextStyle(
                                fontSize: 20,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = Colors.black,
                              ),
                            ),
                            // Solid text as fill.
                            Text(
                              'Cage',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        )
                      ],
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
            ],
          ),
        ),
      ),
    );
  }
}
