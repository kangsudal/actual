import 'package:actual/common/const/data.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:actual/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_detail_model.g.dart';

@JsonSerializable()
class RestaurantDetailModel extends RestaurantModel {
  String detail;
  List<RestaurantProductModel> products;

  RestaurantDetailModel({
    required super.id,
    required super.name,
    @JsonKey(
      fromJson: DataUtils.pathToUrl,
    )
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

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailModelFromJson(json);
}

@JsonSerializable()
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

  // factory RestaurantProductModel.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return RestaurantProductModel(
  //     id: json['id'],
  //     name: json['name'],
  //     imgUrl: "http://$ip${json['imgUrl']}",
  //     detail: json['detail'],
  //     price: json['price'],
  //   );
  // }

  factory RestaurantProductModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantProductModelFromJson(json);
}
