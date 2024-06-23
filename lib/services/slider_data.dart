import 'package:news_app/models/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> slider = [];
  SliderModel sliderModel = SliderModel();

  sliderModel.image = "images/business.jpg";
  sliderModel.name = "Business";
  slider.add(sliderModel);
  sliderModel = SliderModel(); 

  sliderModel.image = "images/entertainment.jpg";
  sliderModel.name = "Entertainment";
  slider.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.image = "images/general.jpg";
  sliderModel.name = "General";
  slider.add(sliderModel);
  sliderModel = SliderModel();

  return slider;
}
