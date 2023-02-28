import 'package:actual/common/const/data.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';

class RestaurantDetailModel extends RestaurantModel {
  String detail;
  List<RestaurantProductModel> products;

  RestaurantDetailModel({
    required super.id,
    required super.name,
    required super.thumbUrl,
    required super.tags,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.deliveryTime,
    required super.deliveryFee,
    required this.detail,
    required this.products,
  });

  factory RestaurantDetailModel.fromJson({required Map<String, dynamic> json}) {
    return RestaurantDetailModel(
      id: json['id'],
      name: json['name'],
      thumbUrl: "http://$ip${json['thumbUrl']}",
      tags: List<String>.from(json['tags']),
      priceRange: (RestaurantPriceRange.values
              .firstWhere((element) => element.name == json['priceRange']))
          .toString(),
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
      detail: json['detail'],
      products: json['products']
          .map<RestaurantProductModel>(
            (x) => RestaurantProductModel.fromJson(
              json: x,
            ),
          )
          .toList(),
    );
  }
}

class RestaurantProductModel {
  String id;
  String name;
  String imgUrl;
  String detail;
  int price;

  RestaurantProductModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price,
  });

  factory RestaurantProductModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantProductModel(
      id: json['id'],
      name: json['name'],
      imgUrl: "http://$ip${json['imgUrl']}",
      detail: json['detail'],
      price: json['price'],
    );
  }
}