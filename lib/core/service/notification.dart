import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:doctor_app/core/utils/string.dart';

class NotificationServics {
  String url = //"https://api.onesignal.com/notifications?c=push";
  "https://api.onesignal.com/notifications";

  static Dio dio=Dio();
  //sendNotification(String title, String description) async {
  Future<void> sendNotification(String title, String description) async {
    try {
      var response = await dio.post(
          url,
          options: Options(
            headers: {
              "Authorization": "Bearer ${AppStrings.APPkey}",
              'content-type': 'application/json',
             "accept":'application/json',

  "firefox_icon": AppStrings.unknowmimage,
           "app_url": AppStrings.unknowmimage,
         
        
            },
          ),
          data: jsonEncode({
            "app_id":  AppStrings.appID,
            "contents": {"en": description},
//            "included_segments": ["Test Users"],
            "included_segments": ["All"],

             "headings": {"en": title},
             "big_picture":"https://www.adobe.com/acrobat/hub/media_173d13651460eb7e12c0ef4cf8410e0960a20f0ee.jpeg?width=750&format=jpeg&optimize=medium" ,
              "small_icon":"ic_stat_onesignal_default"

          })
          
          );

      if (response.statusCode == 200) {
        print("fffffffffffffffffffff${response }");
      }else {
      print("Failed to send notification: ${response.data}");
    }
  } on DioException catch (e) {
    print("DioException: ${e.response?.data ?? e.message}");
  } catch (e) {
    print("Unexpected error: $e");
  }
    //} on DioException catch (e) {
      //print("111111111111111111111111111$e");
    //}
  }


}
