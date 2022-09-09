class ServiceModel {
  String? img;
  String? cloth;
  String? price;
  ServiceModel({this.img, this.cloth, this.price});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      img: json['image_url'],
      cloth: json['type_of_cloth'],
      price: json['price'],
    );
  }
}
