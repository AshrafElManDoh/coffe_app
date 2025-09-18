import 'package:coffe_app/models/drink_model.dart';
import 'package:coffe_app/widgets/quantity_widget.dart';
import 'package:coffe_app/widgets/switch_widget.dart';
import 'package:flutter/material.dart';

class DrinkDetailsBody extends StatefulWidget {
  const DrinkDetailsBody({super.key, required this.itemIndex});
  final int itemIndex;

  @override
  State<DrinkDetailsBody> createState() => _DrinkDetailsBodyState();
}

class _DrinkDetailsBodyState extends State<DrinkDetailsBody> {
  late PageController pageController;
  late double currentPage;
  int selectedSize = 0;
  final drinks = DrinkModel.drinks;
  final sizes = ["Small", "Medium", "Large"];
  @override
  void initState() {
    super.initState();
    currentPage = widget.itemIndex.toDouble();
    pageController = PageController(
      viewportFraction: 0.5,
      initialPage: widget.itemIndex,
    );
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          right: 16,
          left: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    drinks[currentPage.round()].name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    drinks[currentPage.round()].title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                "\$ ${drinks[currentPage.round()].price}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        PageView.builder(
          itemCount: drinks.length,
          scrollDirection: Axis.horizontal,
          controller: pageController,
          itemBuilder: (context, index) {
            double scale = 1 - (currentPage - index).abs();
            double translateX = (currentPage - index).abs() * 400;
            return Transform.translate(
              offset: Offset(translateX, 0),
              child: Transform.scale(
                scale: scale.clamp(0.5, 1),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          bottom: 260,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 20,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 30,
                                  spreadRadius: 2,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Image.asset(
                          drinks[index].image,
                          height: 900,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        //third widget
        Positioned(
          right: 16,
          left: 16,
          bottom: 50,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(30),
                        color: selectedSize == index
                            ? Colors.brown
                            : Colors.white,
                      ),
                      child: Text(
                        sizes[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SwitchWidget(),
                  QuantityWidget()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
