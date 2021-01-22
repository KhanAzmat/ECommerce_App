import 'package:flutter/material.dart';
import './home.dart';
import '../cartProducts.dart';

class Cart extends StatefulWidget {
  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.red,
            centerTitle: true,
            title: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                },
                child: Text('Fashion App')),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {}),
            ]),
        body: cartProducts(),
        bottomNavigationBar: Container(
            color: Colors.white,
            child: Row(children: <Widget>[
              Expanded(
                  child:
                      ListTile(title: Text('Total'), subtitle: Text('\₹230'))),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child:
                      Text('Check Out', style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
              )
            ])));
  }
}
