import 'package:flutter/material.dart';
import './home.dart';

class ProdDetails extends StatefulWidget {
  final prodDetailsName;
  final prodDetailsPicture;
  final prodDetailsOldPrice;
  final prodDetailsPrice;

  ProdDetails({
    this.prodDetailsName,
    this.prodDetailsPicture,
    this.prodDetailsOldPrice,
    this.prodDetailsPrice,
  });
  @override
  _ProdDetailsState createState() => _ProdDetailsState();
}

class _ProdDetailsState extends State<ProdDetails> {
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
            child: Text('Fashion App'),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {}),
          ]),
      body: ListView(children: <Widget>[
        Container(
          height: 300.0,
          child: GridTile(
            child: Container(
              color: Colors.white,
              child: Image.asset(widget.prodDetailsPicture),
            ),
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(widget.prodDetailsName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '\₹${widget.prodDetailsOldPrice}',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                    Expanded(
                      child: Text('\₹${widget.prodDetailsPrice}',
                          style: TextStyle(color: Colors.red)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(children: <Widget>[
          Expanded(
              child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text('Size'),
                              content: Text('Choose the Size'),
                              actions: <Widget>[
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text('Close')),
                              ]);
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(children: <Widget>[
                    Expanded(child: Text('Size')),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    )
                  ]))),
          Expanded(
              child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text('Color'),
                              content: Text('Choose color'),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text('Close'),
                                )
                              ]);
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(children: <Widget>[
                    Expanded(child: Text('Color')),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    )
                  ]))),
          Expanded(
              child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text('Quantity'),
                              content: Text('Select number of items'),
                              actions: <Widget>[
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text('Close'))
                              ]);
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(children: <Widget>[
                    Expanded(child: Text('Qty')),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    )
                  ]))),
        ]),
        Row(
          children: <Widget>[
            Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('Buy Now'))),
            IconButton(
                icon: Icon(Icons.add_shopping_cart, color: Colors.red),
                onPressed: () {}),
            IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
          ],
        ),
        Divider(height: 20, thickness: 5, color: Colors.black),
        ListTile(
          title: Text('Product Details'),
          subtitle: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eget orci enim. Nulla eleifend lectus tellus, aliquet laoreet nulla aliquam lacinia. Vestibulum ut dapibus mi. Aliquam id felis vestibulum, laoreet quam pretium, interdum nulla. Quisque at suscipit risus, ut lacinia nisl. Aliquam non ante orci. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas sit amet augue eleifend, auctor ex quis, tristique eros.'),
        ),
        Divider(height: 20, thickness: 5, color: Colors.black),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text(
                'Product Name',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(widget.prodDetailsName),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text(
                'Product Brand',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('Brand X'),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text(
                'Product Condition',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('New'),
            ),
          ],
        ),
        Divider(height: 20, thickness: 5, color: Colors.black),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Similar Products'),
        ),
        Container(
          height: 360.0,
          child: SimProducts(),
        )
      ]),
    );
  }
}

class SimProducts extends StatefulWidget {
  @override
  SimProductsState createState() => SimProductsState();
}

class SimProductsState extends State<SimProducts> {
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
  ];
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: prodList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            prodName: prodList[index]['name'],
            prodPicture: prodList[index]['picture'],
            prodOldPrice: prodList[index]['old price'],
            prodPrice: prodList[index]['price'],
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
