import 'package:flutter/material.dart';
import 'package:my_app/model/glass.dart';
import 'package:provider/provider.dart';
import './model/cart.dart';
import 'checkout.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Glass> items = [
    Glass(
        imagePath: "assets/images/glass1.png",
        price: 18.5,
        type: "Universal Bridge Fit",
        size: "Small"),
    Glass(
        imagePath: "assets/images/glass2.png",
        price: 20.0,
        type: "Lightweight, Universal Bridge Fit",
        size: "Medium"),
    Glass(
        imagePath: "assets/images/glass3.png",
        price: 15.5,
        type: "Lightweight",
        size: "Small"),
    Glass(
        imagePath: "assets/images/glass4.png",
        price: 31.0,
        type: " Universal Bridge Fit",
        size: "Large"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Eye Glasses"),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Checkout();
                  }));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Consumer<Cart>(builder: (context, cart, child) {
                  return Row(
                    children: [
                      Text("${cart.count}"),
                    ],
                  );
                }),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                shadowColor: Colors.grey,
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return Column(
                      children: [
                        Container(
                            child: Image(
                          image: ExactAssetImage(items[i].imagePath),
                          width: 250,
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${items[i].price}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(Icons.attach_money_outlined)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          items[i].type,
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          items[i].size,
                          style: TextStyle(fontSize: 17),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.purple,
                          ),
                          onPressed: () {
                            cart.add(items[i]);
                          },
                          iconSize: 30,
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          }),
    );
  }
}
