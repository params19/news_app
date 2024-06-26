import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_models.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/services/slider_data.dart';
 

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  List<SliderModel> sliders=[];

  @override
  void initState() {
    categories = getCategories();
    sliders = getSliders();
    super.initState();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Flutter"),
          Text(
            "News",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          )
        ],
      ),
      centerTitle: true,
      elevation: 0.0,
    ),
    body: Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 70,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryTile(
                  image: categories[index].image,
                  categoryName: categories[index].categoryName,
                );
              },
            ),
          ),

          SizedBox(height: 30,),

          CarouselSlider(
            items: sliders.map((slider) {
              return Builder(
                builder: (BuildContext context) {
                  return buildImage(slider.image!, sliders.indexOf(slider), slider.name!);
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 250,
              // viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true ,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget buildImage(String image,int index, String name)=>Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: Stack(
      children: [
        ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(image,height: 250, fit:BoxFit.cover, width: MediaQuery.of(context).size.width,)
      ),
      Container(
        height: 250,
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.only(top: 170),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
        ),
        child: Text(name,style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),)
      )
  ]));
}

class CategoryTile extends StatelessWidget {
 final image, categoryName;
 CategoryTile({this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(image, width: 120, height: 70, fit: BoxFit.cover,)),
        Container(
  width: 120, 
  height: 70,
  decoration: BoxDecoration(
    color: Colors.black38, // Specify color here
    borderRadius: BorderRadius.circular(6), // And other decoration properties
  ),
  child: Center(
    child: Text(
      categoryName, 
      style: const TextStyle(
        color: Colors.white, 
        fontSize: 15,
        fontWeight: FontWeight.bold
      ),
    ),
  ),
)

      ],)
    );
  }
}