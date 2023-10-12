import 'package:dio/dio.dart';

import '../../../services/dio_utils.dart';

abstract class AccountRepo {
  static Future<void> createAccount() async {
    const String url = "http://3.14.153.182:8000/create_account_customer/";
    final Map option = {
      "user_type": "Customer",
      "sign_up_status": true,
      "name": "testUser",
      "email": "xyz@gmail.com",
      "password": "12345678",
      "mobile_no": "9876543210",
      "map_location": "Delhi",
      "latitude": "21.2536521",
      "longitude": "79.36255222",
      "address": "ggn",
      "country_code": "+91,IN",
      "token": "asdfghjkl"
    };
    final Response response =
        await DioUtils.instance.dioClient.post(url, data: option);

    print(response.statusCode);
  }
}
