import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/category_models.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


//This is the home page of the app
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}


//It contains the list of categories and the list of news
class _HomeState extends State<Home> {

  //List of categories: Business, Entertainment, General, Health, Science, Sports, Technology
  List<CategoryModel> categories = [];
  //List of news
  List<SliderModel> sliders = [];
  int activeIndex = 0;

  //Get the list of categories
  @override
  void initState() {
    categories = getCategories();
    sliders = getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar : Flutter News
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            "Flutter",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),

      //Body of the app: Contains the list of categories and the list of news
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 70,
                child: ListView.builder(
        
                  // If true, the scroll view will take up only as much space as its content
                  //Since the parent container has a fixed height, this ensures the ListView doesn't try to expand beyond it.
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
        
              const SizedBox(height: 14),
        
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Breaking News!",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 20),
        
              CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder: (context, index, realIndex) {
                  String? res = sliders[index].image;
                  String? res1 = sliders[index].name;
                  return buildImage(res!, index, res1!);
                },
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
        
              
              const SizedBox(height: 18),
        
              Center(child: buildIndicator(),),
        
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending News!",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
        
            const SizedBox(height: 20),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child :Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/sports.jpg",
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  
                      const SizedBox(width: 8),
                  
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/1.7,
                            child: Text(
                                "Australia vs England: 1st Test, Day 1",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17.0,
                                ),
                              ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: MediaQuery.of(context).size.width/1.7,
                            child: Text(
                                "Live updates from the first Ashes Test between Australia and England at the Gabba.",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
             ),
             const SizedBox(height: 10),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child :Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/sports.jpg",
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  
                      const SizedBox(width: 8),
                  
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/1.7,
                            child: Text(
                                "Australia vs England: 1st Test, Day 1",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17.0,
                                ),
                              ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: MediaQuery.of(context).size.width/1.7,
                            child: Text(
                                "Live updates from the first Ashes Test between Australia and England at the Gabba.",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
             )
        
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            height: 250,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          height: 250,
          padding: const EdgeInsets.only(left: 10),
          margin: const EdgeInsets.only(top: 170),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: sliders.length,
    effect: const SlideEffect(
      dotWidth: 15,
      dotHeight: 15,
      activeDotColor: Colors.blue,
    ),
  );
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;

  CategoryTile({this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              width: 120,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                categoryName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
