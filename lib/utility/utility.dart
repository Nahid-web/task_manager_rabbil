import 'package:shared_preferences/shared_preferences.dart';

Future<void> writeUserdata(userData) async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', userData['token']);
  await prefs.setString('email', userData['data']['email']);
  await prefs.setString('firstName', userData['data']['firstName']);
  await prefs.setString('lastName', userData['data']['lastName']);
  await prefs.setString('mobile', userData['data']['mobile']);
  await prefs.setString('photo', userData['data']['photo']);
}
Future<void> writeVerifyEmail(email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('verifyEmail', email);
}

Future<void> writeOtpPin(otp) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('otp', otp);
}

Future<String?> readUserData(key) async {
  final prefs = await SharedPreferences.getInstance();
  String? readData =  prefs.getString(key);
  return readData;
}