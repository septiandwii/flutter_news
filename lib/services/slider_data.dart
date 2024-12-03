import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/models/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> slider = [];
  SliderModel categoryModel = new SliderModel();

  categoryModel.image = "images/business.jpg";
  categoryModel.name = "Bow To The Authority of Silenforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = "images/entertainment.jpg";
  categoryModel.name = "Bow To The Authority of Silenforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = "images/health.jpg";
  categoryModel.name = "Bow To The Authority of Silenforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = "images/sports.jpg";
  categoryModel.name = "Bow To The Authority of Silenforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  return slider;
}
