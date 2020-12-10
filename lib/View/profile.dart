import 'package:flutter/material.dart';
import 'package:flutter_app_homeone/View/profilesettings.dart';
class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "When",
          style: TextStyle(color: Colors.pink.shade900, fontSize: 25),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,

        actions: <Widget>[
          RaisedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>profilesettings()),
            ),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(0.0)),
            textColor: Colors.pink.shade900,
            color: Colors.white,
            child: Text('Profili Düzenle',style: TextStyle(fontWeight: FontWeight.bold),),

          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'assets/chris.jpg',
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(62.5),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/chris.jpg'))),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Utku Eren Bulut',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0),
              Text(
                'Girne, Kıbrıs',
                style: TextStyle(fontFamily: 'Montserrat', color: Colors.pink.shade900),
              ),
              SizedBox(height: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '25',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Arkadaşlar',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.pink.shade900),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '31',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          'Favori Mekanlar',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.pink.shade900),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '21',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Favori Etkinlikler',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.pink.shade900),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }




}
