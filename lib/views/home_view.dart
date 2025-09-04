import 'package:coffe_app/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: false,
        elevation: 0,
        centerTitle: true,
        leading: Icon(Icons.coffee),
        title: Text(
          "Coffe App",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: HomeBody(),
    );
  }
}
