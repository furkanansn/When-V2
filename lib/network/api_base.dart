import 'package:flutter/foundation.dart';

class APIBase{
  static String get baseURL{
    if(kReleaseMode){
      return 'api url here';
    }else{
      return "https://when-hobedtech.herokuapp.com";
    }
  }
}