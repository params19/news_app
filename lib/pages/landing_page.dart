import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children :[
            Image.asset(
              "assets/image.png",
              width: MediaQuery.of(context).size.width,
              height: 400,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}