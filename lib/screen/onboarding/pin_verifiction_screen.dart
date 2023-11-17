import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_rabbil/api/api_client.dart';
import 'package:task_manager_rabbil/style/style.dart';
import 'package:task_manager_rabbil/utility/utility.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {

  Map<String, String> formValues = {"otp" : ""};

  bool isLoading = false;

  inputOnChange(mapKey, inputValue) {
    formValues.update(mapKey, (value) => inputValue);
  }

  formOnSubmission() async {
    if (formValues["otp"]!.isEmpty) {
      showSnackMessage('Otp Required', context);
    }
    else {
      setState(() {
        isLoading = true;
      });
      String? verifyEmail = await readUserData('verifyEmail');
      bool res = await verifyOTPRequest(verifyEmail, formValues["otp"], context);

      if (res) {
        //navigation to dashboard
        Navigator.pushNamed(context, "/set_password");
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
                Text('Pin Verification', style: head1Text(colorDarkBlue),),
                const SizedBox(height: 10,),
                Text(
                  'A 6 digit verification pin sent to your email address',
                  style: head6Text(colorDarkBlue),),
                const SizedBox(height: 10,),
                PinCodeTextField(
                  onChanged: (inputValue){
                    inputOnChange("otp", inputValue);
                  },
                    appContext: context,
                    length: 6,
                  pinTheme: appOTPStyle(),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: (){
                      formOnSubmission();
                    },
                    style: okButtonStyle(),
                    child: const Text('Verify'),),
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
                      Text("Have account ? ", style: head6Text(colorDarkBlue),),
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
