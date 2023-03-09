import 'package:actual/restaurant/model/restaurant_detail_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

@RestApi()
abstract class RestaurantRepository {
  // http://$ip/restaurant
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  // // http://$ip/restaurant/
  // @GET('/')
  // paginate()

  // http://$ip/restaurant/:id
  @GET('/{id}') //baseUrl/{id}에 get요청을 한다는 뜻
  @Headers({'authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3RAY29kZWZhY3RvcnkuYWkiLCJzdWIiOiJmNTViMzJkMi00ZDY4LTRjMWUtYTNjYS1kYTlkN2QwZDkyZTUiLCJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNjc4MzMzMDYxLCJleHAiOjE2NzgzMzMzNjF9.YC9z0rxsS0w-LdIS-RxFsAIPQj5qVg4ksDOQ1FMppNU'})//강제로 헤더 설정
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path() required String id,
  });
}
