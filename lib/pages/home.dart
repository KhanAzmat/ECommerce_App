import 'package:ECommerce_flutter/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../HorizonList.dart';
import '../Products.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class home extends StatefulWidget {
  @override
  homeState createState() => homeState();
}

class homeState extends State<home> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> LogOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: login()));
  }

  @override
  Widget build(BuildContext context) {
    Widget imgCarousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: false,
//       animationCurve: Curves.fastOutSlowIn,
//       animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.red,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('Fashion App'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                }),
          ]),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('TestName'),
            accountEmail: Text('testMail@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.person, color: Colors.yellow),
              ),
            ),
            decoration: BoxDecoration(color: Colors.red),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.account_box, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(Icons.shopping_basket, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.dashboard, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: () {
              LogOut();
            },
            child: ListTile(
              title: Text('LogOut'),
              leading: Icon(Icons.logout, color: Colors.red),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.help, color: Colors.black),
            ),
          ),
        ]),
      ),
      body: Column(
        children: <Widget>[
          imgCarousel,
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
                alignment: Alignment.centerLeft, child: Text('Categories')),
          ),
          HorizonList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text('Recent Products')),
          ),
          Flexible(child: Products()),
        ],
      ),
    );
  }
}

/*class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}*/
