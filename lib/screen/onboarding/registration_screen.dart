import 'package:flutter/material.dart';
import 'package:task_manager_rabbil/api/api_client.dart';
import 'package:task_manager_rabbil/style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Map<String, String> formValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "verifyPassword": "",
  };

  bool isLoading = false;

  inputOnChange(mapKey, inputValue) {
       formValues.update(mapKey, (value) => inputValue);
  }

  formOnSubmission() async {
    if (formValues["email"]!.isEmpty) {
      showSnackMessage('Email Required', context);
    }
    else if (formValues["firstName"]!.isEmpty) {
      showSnackMessage('First Name Required', context);
    }
    else if (formValues["lastName"]!.isEmpty) {
      showSnackMessage('Last Name Required', context);
    }
    else if (formValues["mobile"]!.isEmpty) {
      showSnackMessage('Mobile Number Required', context);
    }
    else if (formValues["password"]!.isEmpty) {
      showSnackMessage('Password Required', context);
    }
    else if (formValues["verifyPassword"]!.isEmpty) {
      showSnackMessage('Verify Password Required', context);
    }
    else if (formValues["password"]! != formValues["verifyPassword"]!) {
      showSnackMessage('Password and Verify password should be match  ', context);
    }
    else {
      setState(() {
        isLoading = true;
      });
      bool res = await registrationRequest(formValues, context);
      if (res) {
        //navigation to dashboard
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', (route) => false);
      }
      else {

      }
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          isLoading? const Center(child: CircularProgressIndicator()) :
          Container(
            padding: const EdgeInsets.all(30),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Join With Us', style: head1Text(colorDarkBlue),),
                const SizedBox(height: 10,),
                TextFormField(
                  onChanged: (inputValue){
                    inputOnChange('email', inputValue);
                  },
                    decoration: appInputDecoration('Email')),
                const SizedBox(height: 10,),
                TextFormField(
                    onChanged: (inputValue){
                      inputOnChange('firstName', inputValue);
                    },
                    decoration: appInputDecoration('First Name')),
                const SizedBox(height: 10,),
                TextFormField(
                    onChanged: (inputValue){
                      inputOnChange('lastName', inputValue);
                    },
                    decoration: appInputDecoration('Last Name')),
                const SizedBox(height: 10,),
                TextFormField(
                    onChanged: (inputValue){
                      inputOnChange('mobile', inputValue);
                    },
                    decoration: appInputDecoration('Mobile')),
                const SizedBox(height: 10,),
                TextFormField(
                    onChanged: (inputValue){
                      inputOnChange('password', inputValue);
                    },
                    decoration: appInputDecoration('Password')),
                const SizedBox(height: 10,),
                TextFormField(
                    onChanged: (inputValue){
                      inputOnChange('verifyPassword', inputValue);
                    },decoration: appInputDecoration('Verify Password')),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: (){
                      print(formValues);
                      formOnSubmission();
                    },
                    style: okButtonStyle(),
                    child: const Icon(Icons.arrow_circle_right))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
