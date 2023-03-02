import 'package:actual/common/const/data.dart';

class DataUtils {
  ///@JsonKey에 들어갈 함수는 static 함수로 만들어줘야한다.
  static pathToUrl(String thumbUrl) {
    return "http://$ip$thumbUrl";
  }
}
