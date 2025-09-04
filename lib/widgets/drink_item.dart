import 'package:flutter/material.dart';

class DrinkItem extends StatelessWidget {
  const DrinkItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(15),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
              child: Row(),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 20,
          bottom: 45,
          child: Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              Container(
                height: 20,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 25,
                      spreadRadius: 5,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              Image.asset("assets/drinks/Chocolate.png", fit: BoxFit.contain),
            ],
          ),
        ),
        Positioned(
          top: 50,
          left: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chocolate",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text("A fresh juice", style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.black38,
            ),
          ),
        ),
      ],
    );
  }
}
