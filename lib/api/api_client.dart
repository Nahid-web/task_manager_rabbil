import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_manager_rabbil/utility/utility.dart';

import '../style/style.dart';

var baseURL="https://task.teamrabbil.com/api/v1";
var requestHeader={"Content-Type":"application/json"};

Future<bool> loginRequest(formValues, context) async{
  var url = Uri.parse("$baseURL/login");
  var postBody = json.encode(formValues);
  var response = await http.post(
      url,
      headers : requestHeader,
      body: postBody);

  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody['status'] == "success"){
    showSnackMessage('Request Success', context);
    // await WriteUserData(resultBody);
    await writeUserdata(resultBody);
    return true;
  }
  else{
    showSnackMessage('Request failed ! try again ', context);
    return false;
  }
}

Future<bool> registrationRequest(formValues, context) async{
  var url = Uri.parse("$baseURL/registration");
  var postBody=json.encode(formValues);
  var response= await  http.post(
      url,
      headers:requestHeader,
      body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody['status']=="success"){
    showSnackMessage("Request Success", context);
    return true;
  }
  else{
    showSnackMessage('Request fail ! try again', context);
    return false;
  }
}

Future<bool> verifyEmailRequest(email, context) async{
  var url = Uri.parse("$baseURL/RecoverVerifyEmail/$email");
  var response= await http.get(
      url ,
      headers:requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if(resultCode == 200 && resultBody['status'] == "success"){
    await writeVerifyEmail(email);
    showSnackMessage('Request sent', context);
    return true;
  }
  else{
    showSnackMessage('Request failed', context);
    return false;
  }
}

Future<bool> verifyOTPRequest(email,otp,context) async{
  var url = Uri.parse("$baseURL/RecoverVerifyOTP/$email/$otp");
  var response = await  http.get(url ,headers:requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody['status'] == "success"){
    await writeOtpPin(otp);
    showSnackMessage('Request Success', context);
    return true;
  }
  else{
    showSnackMessage('Request fail ! try again', context);
    return false;
  }
}

Future<bool> setPasswordRequest(formValues, context) async{
  var url = Uri.parse("$baseURL/RecoverResetPass");
  var postBody = json.encode(formValues);
  var response= await  http.post(
      url ,
      headers:requestHeader,
      body: postBody);

  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if(resultCode == 200 && resultBody['status'] == "success"){
    showSnackMessage('Request Success', context);
    return true;
  }
  else{
    showSnackMessage('Request fail ! try again', context);
    return false;
  }
}

Future<List> taskListRequest(status, context) async{
  var url = Uri.parse("$baseURL/listTaskByStatus/$status");
  var token = await readUserData('token');
  var requestHeaderWithHeader = {"Content-Type":"application/json", "token":token!};
  var response = await http.get(url , headers: requestHeaderWithHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    showSnackMessage('Request Success', context);
    return resultBody['data'];
  }
  else {
    showSnackMessage('Request fail ! try again', context);
    return [];
  }

}

// Future<List> taskListRequest(status) async {
//   var url = Uri.parse("$baseURL/listTaskByStatus/$status");
//   String? token= await ReadUserData("token");
//   var requestHeaderWithToken={"Content-Type":"application/json","token":token};
//   var response= await http.get(url,headers:requestHeaderWithToken);
//   var resultCode=response.statusCode;
//   var resultBody=json.decode(response.body);
//   if(resultCode == 200 && resultBody['status']=="success"){
//     successToast("Request Success");
//     return resultBody['data'];
//   }
//   else{
//     errorToast("Request fail ! try again");
//     return [];
//   }
// }

// Future<bool> taskCreateRequest(formValues) async {
//
//   var url = Uri.parse("$baseURL/createTask");
//
//   String? token= await ReadUserData("token");
//   var requestHeaderWithToken={"Content-Type":"application/json","token":token};
//
//   var postBody=json.encode(formValues);
//
//   var response= await http.post(url,headers:requestHeaderWithToken,body: postBody);
//   var resultCode=response.statusCode;
//   var resultBody=json.decode(response.body);
//   if(resultCode == 200 && resultBody['status']=="success"){
//     successToast("Request Success");
//     return true;
//   }
//   else{
//     errorToast("Request fail ! try again");
//     return false;
//   }
// }


// Future<bool> taskDeleteRequest(id) async {
//   var url = Uri.parse("$baseURL/deleteTask/$id");
//   String? token= await ReadUserData("token");
//   var requestHeaderWithToken={"Content-Type":"application/json","token":token};
//   var response= await http.get(url ,headers:requestHeaderWithToken);
//   var resultCode=response.statusCode;
//   var resultBody=json.decode(response.body);
//   if(resultCode==200 && resultBody['status']=="success"){
//     successToast("Request Success");
//     return true;
//   }
//   else{
//     errorToast("Request fail ! try again");
//     return false;
//   }
// }


// Future<bool> taskUpdateRequest(id,status) async {
//   var url = Uri.parse("$baseURL/updateTaskStatus/$id/$status");
//   String? token= await ReadUserData("token");
//   var requestHeaderWithToken={"Content-Type":"application/json","token":token};
//   var response= await http.get(url ,headers:requestHeaderWithToken);
//   var resultCode=response.statusCode;
//   var resultBody=json.decode(response.body);
//   if(resultCode==200 && resultBody['status']=="success"){
//     successToast("Request Success");
//     return true;
//   }
//   else{
//     errorToast("Request fail ! try again");
//     return false;
//   }
// }
