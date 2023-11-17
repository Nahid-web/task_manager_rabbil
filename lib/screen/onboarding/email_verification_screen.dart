import 'package:flutter/material.dart';
import 'package:task_manager_rabbil/api/api_client.dart';
import 'package:task_manager_rabbil/style/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  Map<String, String> formValues = {"verifyEmail": ""};

  bool isLoading = false;

  inputOnChange(mapKey, inputValue) {
    formValues.update(mapKey, (value) => inputValue);
  }

  formOnSubmission() async {
    if (formValues["verifyEmail"]!.isEmpty) {
      showSnackMessage('Verify Email required', context);
    }

    else {
      setState(() {
        isLoading = true;
      });

      bool res = await verifyEmailRequest(formValues['verifyEmail'], context);

      if (res) {
        //navigation to dashboard

        Navigator.pushNamed(context, "/pin_verification");
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
                Text('Your Email Address', style: head1Text(colorDarkBlue),),
                const SizedBox(height: 10,),
                Text(
                  'A 6 digit verification pin sent to your email address',
                  style: head6Text(colorDarkBlue),),
                const SizedBox(height: 10,),
                TextFormField(
                  onChanged: (inputValue){
                    inputOnChange("verifyEmail", inputValue);
                  },
                    decoration: appInputDecoration('Email')),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: (){
                      formOnSubmission();
                    },
                    style: okButtonStyle(),
                    child: const Icon(Icons.arrow_forward_ios_rounded),
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
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have account ? ", style: head6Text(colorDarkBlue),),
                      Text('Sign In', style: head6Text(colorGreen),)
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
