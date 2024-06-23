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
          CarouselSlider(
            items: sliders.map((slider) {
              return Builder(
                builder: (BuildContext context) {
                  return buildImage(slider.image!, sliders.indexOf(slider), slider.name!);
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 200,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget buildImage(String image,int index, String name)=>Container(
    child: Image.asset(image, fit:BoxFit.cover, width: MediaQuery.of(context).size.width,),
  );
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
          width: 120, height: 70,
          color: Colors.black38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(child: Text(categoryName, style: const TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),)),
        )
      ],)
    );
  }
}