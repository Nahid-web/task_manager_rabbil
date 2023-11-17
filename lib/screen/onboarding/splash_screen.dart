import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_rabbil/style/style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          screenBackground(context),
          Center(child: SvgPicture.asset('assets/images/logo.svg')),
        ],
      ),
    );
  }
}
