import 'package:flutter/material.dart';
import 'package:task_manager_rabbil/screen/onboarding/email_verification_screen.dart';
import 'package:task_manager_rabbil/screen/onboarding/login_screen.dart';
import 'package:task_manager_rabbil/screen/onboarding/pin_verifiction_screen.dart';
import 'package:task_manager_rabbil/screen/onboarding/registration_screen.dart';
import 'package:task_manager_rabbil/screen/onboarding/set_password_screen.dart';
import 'package:task_manager_rabbil/screen/onboarding/splash_screen.dart';
import 'package:task_manager_rabbil/screen/task/home_screen.dart';
import 'package:task_manager_rabbil/utility/utility.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await readUserData("token") ;
  if(token == null){
    runApp(const MyApp(initialRoute: '/login',));
  }
  else {
    // runApp(const MyApp(initialRoute: '/new_task_create',));
    runApp(const MyApp(initialRoute: '/',));
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Screen',
      initialRoute: initialRoute,
      routes: {
        '/':(context) => HomeScreen(),
        '/login':(context) => const LoginScreen(),
        '/pin_verification':(context) => const PinVerificationScreen(),
        '/registration':(context) => const RegistrationScreen(),
        '/set_password':(context) => const SetPasswordScreen(),
        '/email_verification':(context) => const EmailVerificationScreen(),
      },
    );
  }
}
