import 'package:flutter/material.dart';

class HorizonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.0,
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          Category(
            imgLocation: 'images/cats/tshirt.png',
            imgCaption: 'Shirt',
          ),
          Category(
            imgLocation: 'images/cats/jeans.png',
            imgCaption: 'Jeans',
          ),
          Category(
            imgLocation: 'images/cats/shoe.png',
            imgCaption: 'Shoes',
          ),
          Category(
            imgLocation: 'images/cats/dress.png',
            imgCaption: 'Dress',
          ),
          Category(
            imgLocation: 'images/cats/formal.png',
            imgCaption: 'Formals',
          ),
          Category(
            imgLocation: 'images/cats/informal.png',
            imgCaption: 'InFormals',
          ),
          Category(
            imgLocation: 'images/cats/accessories.png',
            imgCaption: 'Accessories',
          ),
        ]));
  }
}

class Category extends StatelessWidget {
  final String imgLocation;
  final String imgCaption;

  Category({this.imgLocation, this.imgCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(imgLocation, width: 40.0, height: 40.0),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(imgCaption),
            ),
          ),
        ),
      ),
    );
  }
}
