import 'dart:collection';
import 'dart:convert';
import 'dart:io' show HttpHeaders, Platform;

import 'package:crypto/crypto.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:learn_flutter/constant.dart';
import 'package:learn_flutter/main.dart';
import 'package:learn_flutter/utils/user_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:velocity_x/velocity_x.dart';

class API {
  late Dio _dio;
  String get baseUrl => kHost;
  //kHostDev; //kHost;
  final Map<String, String> headers = {
    HttpHeaders.authorizationHeader: UserManager.userLocal?.token ?? '',
    HttpHeaders.contentTypeHeader: "application/json",
    "X-PiepMe-Api-Version": "2016-12-01", // old
    // "X-PiepMe-Api-Version": "2022-12-01", // new
  };

  API() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
    ))
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          maxWidth: 200,
          logPrint: (o) => debugPrint(o.toString()),
        ),
      );
  }

  Future<Response> getRequest(String endPoint, Map<String, dynamic> data,
      {String? salt}) async {
    return makeRequest(HttpMethod.get, endPoint, data, salt: salt);
  }

  Future<Response> postRequest(String endPoint, Map<String, dynamic> data,
      {String? salt}) async {
    return makeRequest(HttpMethod.post, endPoint, data, salt: salt);
  }

  Future<Response> patchRequest(String endPoint, Map<String, dynamic> data,
      {String? salt}) async {
    return makeRequest(HttpMethod.patch, endPoint, data, salt: salt);
  }

  Future<Response> deleteRequest(String endPoint, Map<String, dynamic> data,
      {String? salt}) async {
    return makeRequest(HttpMethod.delete, endPoint, data, salt: salt);
  }

  Future<Response> makeRequest(
      HttpMethod method, String endPoint, Map<String, dynamic> data,
      {String? salt}) async {
    Response response =
    Response(requestOptions: RequestOptions(path: endPoint));
    data = await createToken(data);
    Map<String, dynamic>? queryParameters;
    if (method == HttpMethod.get) {
      queryParameters = data;
    }

    try {
      _dio.options.headers = headers;
      response = await _dio.request(
        endPoint,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          validateStatus: (status) => true,
          method: method.value,
        ),
      );
    } on DioError catch (e) {
      printWrapped('makeRequest', name: 'API', error: e);
    }
    return response;
  }

  Future<Map<String, dynamic>> createToken(Map<String, dynamic> data,
      {String? salt}) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      data["MODEL"] = androidInfo.model;
      data["SRC"] = "android";
      data["OS"] = androidInfo.version.baseOS;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      data["MODEL"] = iosInfo.utsname.machine;
      data["SRC"] = "ios";
      data["OS"] = iosInfo.systemVersion;
    }
    data["VERSION"] = kVersion;
    data["PROV"] = "CA";
    data["APP"] = "PiepMe";
    String tokenString = sortKey(data, salt: salt);
    data['token'] = generateMd5(tokenString);
    data.remove('keyToken');
    return data;
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  String sortKey(Map<String, dynamic> data, {String? salt}) {
    data['v'] = kVersionToken;
    data['keyToken'] = salt ?? kKeyToken;
    var sorted =
    SplayTreeMap<String, dynamic>.from(data, (a, b) => a.compareTo(b));
    List<String> sortedData = [];
    sorted.forEach((k, v) => {
      if (v.runtimeType == String)
        {sortedData.add('$k=${cleanString(v)}')}
      else if (v is double)
        {sortedData.add('$k=${parseDouble(v)}')}
      else if (v is List)
          {sortedData.add('$k=[${convertList(v)}]')}
        else if (v is Map<String, dynamic>)
            {sortedData.add('$k=[${sortKey2(v)}]')}
          else
            {sortedData.add('$k=${cleanString('{$v}')}')}
    });
    return sortedData.join('&');
  }

  String sortKey2(Map<String, dynamic> data) {
    var sorted =
    SplayTreeMap<String, dynamic>.from(data, (a, b) => a.compareTo(b));
    List<String> sortedData = [];
    sorted.forEach((k, v) => {
      if (v.runtimeType == String)
        {sortedData.add('$k=${cleanString(v)}')}
      else if (v is double)
        {sortedData.add('$k=${parseDouble(v)}')}
      else if (v is List)
          {sortedData.add('$k=[${convertList(v)}]')}
        else if (v is Map<String, dynamic>)
            {sortedData.add('$k=[${sortKey2(v)}]')}
          else
            {sortedData.add('$k=${cleanString('{$v}')}')}
    });
    return sortedData.join('&');
  }

  String cleanString(String value) {
    return value.replaceAll(RegExp(r'[^a-zA-Z0-9]+'), '');
  }

  String convertList(List list) {
    List<String> data = [];
    list.forEachIndexed((k, v) {
      if (v.runtimeType == String) {
        data.add('$k=${cleanString(v)}');
      } else if (v is double) {
        data.add('$k=${parseDouble(v)}');
      } else if (v is List) {
        data.add('$k=[${convertList(v)}]');
      } else if (v is Map<String, dynamic>) {
        data.add('$k=[${sortKey2(v)}]');
      } else {
        data.add('$k=${cleanString('{$v}')}');
      }
    });
    return data.join('&');
  }

  String parseDouble(double number) {
    return number - number.toInt().toDouble() == 0
        ? '${number.toInt()}'
        : cleanString('$number');
  }
}

enum HttpMethod {
  delete('DELETE'),
  get('GET'),
  head('HEAD'),
  options('OPTIONS'),
  patch('PATCH'),
  post('POST'),
  put('PUT');

  final String value;
  const HttpMethod(this.value);
}
