import 'package:flutter/material.dart';
import 'package:task_manager_rabbil/api/api_client.dart';
import 'package:task_manager_rabbil/style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> formValues = {"email": "", "password": ""};

  bool isLoading = false;

  inputOnChange(mapKey, inputValue) {
    formValues.update(mapKey, (value) => inputValue);
  }

  formOnSubmission() async {
    if (formValues["email"]!.isEmpty) {
      showSnackMessage('Email Required', context);
    } else if (formValues["password"]!.isEmpty) {
      showSnackMessage('Password Required', context);
    } else {
      setState(() {
        isLoading = true;
      });
      bool res = await loginRequest(formValues, context);

      if (res) {
        //navigation to dashboard
        Navigator.pushNamedAndRemoveUntil(
            context, '/', (route) => false);
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
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  padding: const EdgeInsets.all(30),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started With',
                        style: head1Text(colorDarkBlue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          onChanged: (inputValue) {
                            inputOnChange("email", inputValue);
                          },
                          decoration: appInputDecoration('Email')),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          onChanged: (inputValue) {
                            inputOnChange("password", inputValue);
                          },
                          decoration: appInputDecoration('Password')),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            print(formValues);
                            formOnSubmission();
                          },
                          style: okButtonStyle(),
                          child: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/email_verification');
                        },
                        child: Text('Forget Password', style: head7Text(colorLightGray),),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/registration');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("don't have account ? ", style: head6Text(colorDarkBlue),),
                            Text('Sign Up', style: head6Text(colorGreen),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
