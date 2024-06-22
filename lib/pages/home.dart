import 'package:flutter/material.dart';
import 'package:news_app/models/category_models.dart';
import 'package:news_app/services/data.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Flutter"),Text("News",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)]
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
                itemBuilder: (context, index){
                  return CategoryTile(
                    image: categories[index].image,
                    categoryName: categories[index].categoryName,
                  );
                }),
              ),
          ],
      ),
    ),
    );
  }
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
          child: Image.asset(image, width: 120, height: 7 0, fit: BoxFit.cover,)),
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