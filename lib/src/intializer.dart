import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_api/src/config.dart';
import 'package:get/get.dart';

class Initializer{
  static Future<void> init() async{
    try{
      WidgetsFlutterBinding.ensureInitialized();
      await
      _initGetConnect();
      _initScreenPreference();
    }catch(e){
      rethrow;
    }
  }

  static void _initScreenPreference(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static Future<void> _initGetConnect() async{
    final connect = GetConnect();
    final url = ConfigEnvironments.getEnvironments()['url'];
    connect.baseUrl = url;
    connect.timeout = const Duration(seconds: 20);
    connect.httpClient.maxAuthRetries = 0;
    Get.put(connect);
  }
}