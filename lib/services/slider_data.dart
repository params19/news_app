import 'package:news_app/models/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> slider = [];
  SliderModel sliderModel = SliderModel();

  sliderModel.image = "assets/business.jpg";
  sliderModel.name = "Business";
  slider.add(sliderModel);
  sliderModel = SliderModel(); 

  sliderModel.image = "assets/entertainment.jpg";
  sliderModel.name = "Entertainment";
  slider.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.image = "assets/geneee.jpg";
  sliderModel.name = "General";
  slider.add(sliderModel);
  sliderModel = SliderModel();

  // sliderModel.image = "assets/health.jpg";
  // sliderModel.name = "Health";
  // slider.add(sliderModel);
  // sliderModel = SliderModel();

  // sliderModel.image = "assets/sports.jpg";
  // sliderModel.name = "Sports";
  // slider.add(sliderModel);
  // sliderModel = SliderModel();

  // sliderModel.image = "assets/science.jpg";
  // sliderModel.name = "Science";
  // slider.add(sliderModel);
  // sliderModel = SliderModel();

  return slider;
}
