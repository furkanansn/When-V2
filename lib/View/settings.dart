import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_homeone/View/bottom_nav_bar.dart';
import 'package:flutter_app_homeone/View/addfavs.dart';
import 'package:flutter_app_homeone/View/forgetpassword.dart';
import 'package:flutter_app_homeone/View/privacy_policy.dart';
import 'package:flutter_app_homeone/View/profilesettings.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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

      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Ayarlar",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ForgetPassword()),
                  ),
                  color: Colors.pink.shade900,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Gündüz Modu'),
                ),
                RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ForgetPassword()),
                  ),
                  color: Colors.pink.shade900,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Gece Modu'),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.pink.shade900,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Hesap Ayarları",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),

            MaterialButton(onPressed: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => profilesettings()));
            },child: ListTile(
              title: Center(
                child: Text(
                  "Yorumlar",style: TextStyle(color: Colors.pink.shade900),
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
              ),
            ),),

            MaterialButton(onPressed: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => addfavs()));
            },child: ListTile(
              title: Center(
                child: Text(
                  "Şehir Değiştir",style: TextStyle(color: Colors.pink.shade900),
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
              ),
            ),),

            MaterialButton(onPressed: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => ForgetPassword()));
            },child: ListTile(
              title: Center(
                child: Text(
                  "Şifre Değiştir",style: TextStyle(color: Colors.pink.shade900),
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
              ),
            ),),

            MaterialButton(onPressed: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => PrivacyPolicy()));
            },child: ListTile(
              title: Center(
                child: Text(
                  "Gizlilik Politikası",style: TextStyle(color: Colors.pink.shade900),
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
              ),
            ),),

            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.pink.shade900,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Bildirimler",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
           SwitchListTile(
             activeColor: Colors.pink.shade900,
             contentPadding: const EdgeInsets.all(0) ,
             value: true,
             title: Text("Çevrendeki Etkinlikler",style: TextStyle(color: Colors.pink.shade900),),
             onChanged: (val){},
           ),
            SwitchListTile(
              activeColor: Colors.pink.shade900,
              contentPadding: const EdgeInsets.all(0) ,
              value: true,
              title: Text("Fırsatlar"),
              onChanged:null,
            ),
            SwitchListTile(
              activeColor: Colors.pink.shade900,
              contentPadding: const EdgeInsets.all(0) ,
              value: true,
              title: Text("Mesajlar",style: TextStyle(color: Colors.pink.shade900)),
              onChanged: (val){},
            ),
           SizedBox(height: 10.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>profilesettings()),
              ),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              textColor: Colors.white,
              color: Colors.pink.shade900,
              child: Text('Çıkış Yap',style:TextStyle(fontSize:15.0) ),
            ),

          ],
        )],
        ),
      ),
    );
  }
  }

