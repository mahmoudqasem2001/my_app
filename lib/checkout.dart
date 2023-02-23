import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("Checkout"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Total Price : "),
                  Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text("${cart.totalPrice}");
                    },
                  ),
                  Icon(Icons.attach_money_outlined)
                ],
              ),
            )
          ],
        ),
        body: Consumer<Cart>(
          builder: (context, cart, child) {
            return ListView.builder(
                itemCount: cart.count,
                itemBuilder: (context, i) {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage(cart.basketItem[i].imagePath),
                          alignment: Alignment.topLeft,
                          width: 80,
                        ),
                        Text(
                          cart.basketItem[i].size,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "${cart.basketItem[i].price}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.attach_money_outlined),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              cart.remove(cart.basketItem[i]);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ));
  }
}
