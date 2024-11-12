import 'dart:convert';
import 'dart:io';

//import 'package:api_bloc/api_exceptions.dart';
import 'package:http/http.dart' as httpclient;

import 'api_exception.dart';
class ApiHelper{
  Future<dynamic> getApi({required String url})async{
    var uri= Uri.parse(url);

    try{
      var res= await httpclient.get(uri,headers: {"authorization":"pcY5Yn0RlRFOIvOj3UqxOXZTH37vEqYtGmqvTib6578ckJIveAwmwQUd"});
      print(" this is ${res.statusCode}");
      return returnJsonResponse(res);
    } on SocketException catch(e){
      throw(FetchDataException(errorMsg: "no internet"));
    }



  }
  dynamic returnJsonResponse(httpclient.Response response){
    switch (response.statusCode){
      case 200:
        {
          var mdata = jsonDecode(response.body);
          return mdata;
        }
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(errorMsg: response.body.toString());
      case 500:
      default :
        throw  FetchDataException(errorMsg: "error occured while communication with server with statuscode: ${response.statusCode}");
    }

  }
}