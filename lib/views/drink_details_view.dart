import 'package:coffe_app/widgets/drink_details_body.dart';
import 'package:flutter/material.dart';

class DrinkDetailsView extends StatelessWidget {
  const DrinkDetailsView({super.key, required this.itemIndex});
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DrinkDetailsBody(itemIndex: itemIndex));
  }
}
