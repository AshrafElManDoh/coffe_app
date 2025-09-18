import 'package:coffe_app/models/drink_model.dart';
import 'package:coffe_app/views/drink_details_view.dart';
import 'package:coffe_app/widgets/drink_item.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: scrollController,
                  builder: (context, child) {
                    double offset = 0;
                    if (scrollController.hasClients) {
                      offset = scrollController.offset / 100 - index;
                    }
                    offset = offset.clamp(0, 2);
                    return Transform.scale(
                      scale: 1 - (offset * .07),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) =>
                                  DrinkDetailsView(itemIndex: index),
                            ),
                          );
                        },
                        child: DrinkItem(drinkModel: DrinkModel.drinks[index]),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: DrinkModel.drinks.length,
            ),
          ),
        ],
      ),
    );
  }
}
