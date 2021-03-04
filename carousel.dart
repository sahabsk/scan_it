class CarouselModel{
  String image;
  CarouselModel(this.image);
}

List<CarouselModel> carousels= carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image":"assets/image/face1.png"},
  {"image":"assets/image/finger1.png"},
  {"image":"assets/image/iris1.png"},
];