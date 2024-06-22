import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Flutter"),Text("News",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)]
      ),
      centerTitle: true,
      elevation: 0.0,
      ),
      body: Container(),
    );
  }
}

class CategoryTile extends StatelessWidget {
 final image, categoryName;
 CategoryTile({this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Image.asset(image, width: 120, height: 60,),
      ],)
    );
  }
}