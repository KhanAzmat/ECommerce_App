import 'package:flutter/material.dart';
import 'pages/ProdDetails.dart';

class Products extends StatefulWidget {
  @override
  ProductsState createState() => ProductsState();
}

class ProductsState extends State<Products> {
  var prodList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old price": 120,
      "price": 100,
    },
    {
      "name": "Dress",
      "picture": "images/products/dress1.jpeg",
      "old price": 120,
      "price": 100,
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "old price": 120,
      "price": 100,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt1.jpeg",
      "old price": 120,
      "price": 100,
    },
    {
      "name": "Heels",
      "picture": "images/products/hills1.jpeg",
      "old price": 100,
      "price": 80,
    },
    {
      "name": "Jeans",
      "picture": "images/products/pants1.jpeg",
      "old price": 120,
      "price": 100,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: prodList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleProd(
              prodName: prodList[index]['name'],
              prodPicture: prodList[index]['picture'],
              prodOldPrice: prodList[index]['old price'],
              prodPrice: prodList[index]['price'],
            ),
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;

  SingleProd({
    this.prodName,
    this.prodPicture,
    this.prodOldPrice,
    this.prodPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProdDetails(
                    prodDetailsName: prodName,
                    prodDetailsPicture: prodPicture,
                    prodDetailsOldPrice: prodOldPrice,
                    prodDetailsPrice: prodPrice))),
            child: GridTile(
                footer: Container(
                    color: Colors.white70,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Text(prodName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0))),
                      Text('\₹$prodPrice',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    ])),
                child: Image.asset(
                  prodPicture,
                  fit: BoxFit.contain,
                )),
          ),
        ),
      ),
    );
  }
}
