import 'package:flutter/material.dart';

class cartProducts extends StatefulWidget {
  @override
  cartProductsState createState() => cartProductsState();
}

class cartProductsState extends State<cartProducts> {
  var prodsOnCart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "size": 'm',
      "price": 100,
      'color': 'Red',
      'quantity': '1',
    },
    {
      "name": "Dress",
      "picture": "images/products/dress1.jpeg",
      "size": 'M',
      "price": 100,
      'color': 'Black',
      'quantity': '1',
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "size": 'UK 10',
      "price": 100,
      'color': 'Brown',
      'quantity': '1',
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt1.jpeg",
      "size": 'L',
      "price": 100,
      'color': 'Red',
      'quantity': '1',
    },
    {
      "name": "Heels",
      "picture": "images/products/hills1.jpeg",
      "size": 'UK 6',
      "price": 80,
      'color': 'Red',
      'quantity': '1',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: prodsOnCart.length,
        itemBuilder: (context, index) {
          return SingCartProd(
            cartProdName: prodsOnCart[index]['name'],
            cartProdPicture: prodsOnCart[index]['picture'],
            cartProdSize: prodsOnCart[index]['size'],
            cartProdPrice: prodsOnCart[index]['price'],
            cartProdColor: prodsOnCart[index]['color'],
            cartProdQty: prodsOnCart[index]['quantity'],
          );
        });
  }
}

class SingCartProd extends StatelessWidget {
  final cartProdName;
  final cartProdPicture;
  final cartProdSize;
  final cartProdPrice;
  final cartProdColor;
  final cartProdQty;

  SingCartProd({
    this.cartProdName,
    this.cartProdPicture,
    this.cartProdSize,
    this.cartProdPrice,
    this.cartProdColor,
    this.cartProdQty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Image.asset(
        cartProdPicture,
        width: 80.0,
        height: 80.0,
      ),
      title: Text(cartProdName),
      subtitle: Column(children: <Widget>[
        Row(children: <Widget>[
          Padding(padding: const EdgeInsets.all(0.0), child: Text('Size :')),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(cartProdSize, style: TextStyle(color: Colors.red))),
          Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: Text('Color :')),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(cartProdColor, style: TextStyle(color: Colors.red)))
        ]),
        Container(
            alignment: Alignment.topLeft, child: Text('\₹$cartProdPrice')),
      ]),
      trailing: Expanded(
        child: Column(children: <Widget>[
          Expanded(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ),
          Expanded(child: Text('$cartProdQty')),
          Expanded(
              child: IconButton(icon: Icon(Icons.remove), onPressed: () {}))
        ]),
      ),
    ));
  }
}
