import 'package:actual/common/const/data.dart';
import 'package:actual/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';

///* 에는 소스 파일의 이름이 들어갑니다. flutter pub run build_runner build
part 'restaurant_model.g.dart';

enum RestaurantPriceRange {
  expensive,
  medium,
  cheap,
}

/// 코드 생성기에 이 클래스가 JSON 직렬화 로직이 만들어져야 한다고 알려주는 어노테이션입니다.
@JsonSerializable()
class RestaurantModel {
  final String id;
  final String name;

  ///변화시키고싶은 속성 위에다가 @JsonKey를 써준다.
  @JsonKey(
    fromJson: DataUtils.pathToUrl,
  )
  final String thumbUrl;
  final List<String> tags;
  final String priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  /*내가만든 factory constructor
  //factory constructor를 만드는 이유: json을 넣기만하면 자동으로 매핑이 되게하기위해
  factory RestaurantModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      thumbUrl: "http://$ip${json['thumbUrl']}",
      tags: List<String>.from(json['tags']),
      priceRange: (RestaurantPriceRange.values
              .firstWhere((element) => element.name == json['priceRange']))
          .toString(), //6:44
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
    );
  }*/

  /// map에서 새로운 RestaurantModel 인스턴스를 생성하기 위해 필요한 팩토리 생성자입니다.
  /// 생성된 `_$RestaurantModelFromJson()` 생성자에게 map을 전달해줍니다
  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  ///현재 인스턴스(RestaurantModel)에서 json으로 바꿀때 사용
  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);
}
