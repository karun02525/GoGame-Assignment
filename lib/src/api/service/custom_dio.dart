import 'package:dio/dio.dart';

class CustomDio{
  var _dio;
  CustomDio(){
    _dio=Dio();
  }


  CustomDio.withAuthentication(){
    _dio=Dio();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest:_onRequest,onResponse:_onResponse,onError: _onError
    ));
  }

  Dio get instance=>_dio;
  _onRequest(RequestOptions options) async {
    print('*************************@@**********************************');
    print('send request：path:${options.path}，baseURL:${options.baseUrl}');
    print('*************************@@@@*******************************');

  }

  _onResponse(Response response)  {
     return response;
  }

  _onError(DioError error) {
    print('********************  ${error.response?.statusCode}  ********************************');

  }
}