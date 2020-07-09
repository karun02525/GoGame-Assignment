import 'dart:convert';
import 'package:gogame_app/src/utils/global.dart';

class ApiErrorHandel{



 static errorHandel(e){
   dynamic errorMessage="";
    try {
      errorMessage = jsonDecode(jsonEncode(e.response.data));
    } catch (e) {
      Global.toast('Something went wrong');
    }
    var statusCode = e.response.statusCode;
    if (statusCode == 400) {
      Global.toast(errorMessage['message']);
    } else if (statusCode == 401) {
      Global.toast(errorMessage['message']);
    } else if (statusCode == 403) {
      Global.toast(errorMessage['message']);
    } else if (statusCode == 404) {
      Global.toast(errorMessage['message']);
    } else if (statusCode == 500) {
      Global.toast('Something went wrong please try again!!');
    }else {
      Global.toast('Something went wrong');

    }
  }

}