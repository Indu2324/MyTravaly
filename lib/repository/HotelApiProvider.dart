import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/HotelListData.dart';
import '../utils/app_constant.dart';

class HotelApiProvider {

  Future<HotelListData> fetchHotels() async {
    try {
      final response = await http.post(
        Uri.parse(AppConstant.baseUrl),
        headers: {
          'authtoken': AppConstant.authToken,
          'visitortoken': AppConstant.visitorToken,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "action": "popularStay",
          "popularStay": {
            "limit": 10,
            "entityType": "Any",
            "filter": {
              "searchType": "byCity",
              "searchTypeInfo": {
                "country": "India",
                "state": "Jharkhand",
                "city": "Jamshedpur",
              },
            },
            "currency": "INR",
          },
        }),
      );

      if (response.statusCode == 200) {
        return HotelListData.fromJson(json.decode(response.body));
      } else {
        throw Exception(AppConstant.failLoadMsg);
      }
    } catch (e) {
      rethrow;
    }
  }
}