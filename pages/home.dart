import 'package:flutter/material.dart';

import 'washing.dart';

class MainBoard extends StatefulWidget {
  const MainBoard({super.key});
  @override
  MainBoardState createState() => MainBoardState();
}

class MainBoardState extends State<MainBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome,",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600]),
                      ),
                      Text(
                        "Mufasa",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]),
                      )
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        Drawer(
                          child: ListView(
                            // Important: Remove any padding from the ListView.
                            padding: EdgeInsets.zero,
                            children: [
                              const DrawerHeader(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                ),
                                child: Text('Drawer Header'),
                              ),
                              ListTile(
                                title: const Text('Item 1'),
                                onTap: () {
                                  // Update the state of the app.
                                  // ...
                                },
                              ),
                              ListTile(
                                title: const Text('Item 2'),
                                onTap: () {
                                  // Update the state of the app.
                                  // ...
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Icon(Icons.menu))
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildItemMenu("assets/images/washer.png", "Washing"),
                  buildItemMenu("assets/images/deep.png", "Steam press"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildItemMenu("assets/images/dry.png", "Dry cleaning"),
                  buildItemMenu("assets/images/formal.png", "Formal Wash"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildItemMenu("assets/images/deep.png", "Deep cleaning "),
                  buildItemMenu("assets/images/powder.png", "Powder Wash"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Current orders (3)",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700]),
                  ),
                  const Text(
                    "View all",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(0, 1))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 1),
                                blurRadius: 1)
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/delivery-truck.png",
                          height: 40,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Order No : #1234567890",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Out of delivery",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemMenu(String image, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Washing()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            ClipRect(
                child: Image.asset(
              image,
              width: 100,
              height: 80,
              fit: BoxFit.fill,
            )),
            const SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
