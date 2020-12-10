import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_homeone/View/etkinlik.dart';
import 'package:flutter_app_homeone/View/profile.dart';
import 'package:flutter_app_homeone/View/settings.dart';
import 'package:flutter_app_homeone/View/bottom_nav_bar.dart';
import 'package:flutter_app_homeone/entity/House.dart';
import 'package:flutter_app_homeone/network/api_response.dart';
import 'package:flutter_app_homeone/providers/HouseProvider.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'Time.dart';
import 'drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;
  Time time = new Time();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
      ),

        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isDrawerOpen
                      ? GestureDetector(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        isDrawerOpen = false;
                      });
                    },
                  )
                      : GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () {
                      setState(() {
                        xOffset = 290;
                        yOffset = 80;
                        isDrawerOpen = true;
                      });
                    },
                  ),
                  Text(
                        time.main(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        decoration: TextDecoration.none),
                  ),
                  Container(),
                ],
              ),
            ),

         houseList(context,)
          ],
        ),

    );
  }

  Widget houseList(BuildContext context) {
    return Consumer<HouseProvider>(builder: (context, myModel, child) {
      if (myModel.houseList.status == Status.COMPLETED) {
        return listView(myModel.houseList.data);
      } else if (myModel.houseList.status == Status.ERROR) {
        return Text(myModel.houseList.message);
      } else if (myModel.houseList.status == Status.NULL) {
        return Text(myModel.houseList.message);
      }
      return Text("Yükleniyor ...");
    });
  }

  Widget listView(List<House> list) {
    print(list.length);
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int i) {
          return Column(
            children: <Widget>[
              NewPadding(
                image1: list[i].eventImagePath,
                text1: list[i].title,
                image2: list[i + 1].eventImagePath,
                text2: list[i + 1].title,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          );
        });
  }
}

class NewPadding extends StatelessWidget {
  final String image1;
  final String text1;
  final String image2;
  final String text2;

  const NewPadding({
    Key key,
    this.image1,
    this.text1,
    this.image2,
    this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/placeholder.png",
                    image: image1,
                    width: 100,
                    height: 100,
                  ),

                  /*Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(image1),
                  ),*/
                ),
                Text(
                  text1,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      decoration: TextDecoration.none),
                )
              ],
            ),
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/placeholder.png",
                      image: image1,
                      width: 100,
                      height: 100,
                    )),
                Text(
                  text2,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      decoration: TextDecoration.none),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
