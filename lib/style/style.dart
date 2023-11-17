import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen=Color.fromRGBO(33, 191, 115, 1);
const colorBlue=Color.fromRGBO(52, 152, 219,1.0);
const colorOrange=Color.fromRGBO(230, 126, 34,1.0);
const colorWhite=Color.fromRGBO(255, 255, 255,1.0);
const colorDarkBlue=Color.fromRGBO(44, 62, 80,1.0);
const colorLightGray=Color.fromRGBO(135, 142, 150, 1.0);
const colorLight=Color.fromRGBO(211, 211, 211, 1.0);

SvgPicture screenBackground(context){
  return SvgPicture.asset(
    'assets/images/background.svg',
    alignment: Alignment.center,
    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.cover,
  );
}

InputDecoration appInputDecoration(label){
  return InputDecoration(
      focusedBorder:   OutlineInputBorder(
        borderSide:  const BorderSide(color: colorGreen),
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: colorWhite,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: OutlineInputBorder(
        borderSide:  const BorderSide(color: colorWhite, width: 0.0),
        borderRadius: BorderRadius.circular(10),
      ),
      border: const OutlineInputBorder(),
      labelText: label
  );
}

ButtonStyle okButtonStyle(){
  return ElevatedButton.styleFrom(
      backgroundColor: colorGreen,
      minimumSize: const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

TextStyle head1Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w700,
  );
}

TextStyle head6Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 16,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400
  );
}
TextStyle head7Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 13,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400
  );
}

PinTheme appOTPStyle(){
  return  PinTheme(
    inactiveColor: colorLight,
    inactiveFillColor: colorWhite,
    selectedColor: colorGreen,
    activeColor: colorWhite,
    selectedFillColor: colorGreen,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 45,
    activeFillColor: Colors.white,
  );
}


showSnackMessage(snackMessage, context ){
   final snackBar = SnackBar(
    content: Text(snackMessage),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

