import 'package:news_app/models/category_models.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  // 1
  categoryModel.categoryName = "Business";
  categoryModel.image = "assets/business.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 2
  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "assets/entertainment.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 3
  categoryModel.categoryName = "General";
  categoryModel.image = "assets/geneee.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 4
  categoryModel.categoryName = "Health";
  categoryModel.image = "assets/health.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 5
  categoryModel.categoryName = "Science";
  categoryModel.image = "assets/science.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 6
  categoryModel.categoryName = "Sports";
  categoryModel.image = "assets/sports.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();


  return category;
}