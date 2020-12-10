import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app_homeone/network/api_base.dart';
import 'package:flutter_app_homeone/network/api_exceptions.dart';
import 'package:http/http.dart' as http;

class HttpClient{
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;


  Future<dynamic> fetchData(String url,{Map<String,String> params}) async{
    var responseJson;
    var uri = APIBase.baseURL + url + ((params != null) ? this.queryParameters(params): "");
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try{
      final response = await http.get(uri,headers: header);
      print(response.body.toString());
      responseJson = _returnResponse(response);
    } on SocketException{
      throw FetchDataException('İnternet bağlantısı yok');
    }
    return responseJson;
  }


  Future<dynamic> postData(String url,dynamic body) async{
    var responseJson;
    var header={HttpHeaders.contentTypeHeader:'application/json'};
    try{
      final response = await http.post(APIBase.baseURL + url,body: body,headers: header);
      responseJson = _returnResponse(response);
    } on SocketException{
      throw FetchDataException("İnternet bağlantısı yok");
    }
  }


  Future<dynamic> updateData(String url,dynamic body) async{
    var responseJson;
    var header={HttpHeaders.contentTypeHeader:'application/json'};
    try{
      final response = await http.put(APIBase.baseURL + url,body: body,headers: header);
      responseJson = _returnResponse(response);
    } on SocketException{
      throw FetchDataException("İnternet bağlantısı yok");
    }
  }

  Future<dynamic> deleteData(String url,{Map<String,String> params}) async{
    var responseJson;
    var uri = APIBase.baseURL + url + ((params != null) ? this.queryParameters(params): "");
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try{
      final response = await http.delete(uri,headers: header);
      print(response.body.toString());
      responseJson = _returnResponse(response);
    } on SocketException{
      throw FetchDataException('İnternet bağlantısı yok');
    }
    return responseJson;
  }









  String queryParameters(Map<String, String> params) {
    if(params != null){
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return "";
  }

  dynamic _returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Server ile bağlantı hatası sağlandı. Hata kodu : ${response.statusCode}');
    }
  }
}

