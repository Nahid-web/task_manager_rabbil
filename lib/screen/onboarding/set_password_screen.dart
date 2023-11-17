import 'package:flutter/material.dart';
import 'package:task_manager_rabbil/api/api_client.dart';
import 'package:task_manager_rabbil/style/style.dart';
import 'package:task_manager_rabbil/utility/utility.dart';
class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  Map<String, String> formValues = {
    "email": "",
    "OTP": "",
    "password": "",
    "confirmPassword": "",

  };

  bool isLoading = false;

  inputOnChange(mapKey, inputValue) {
    formValues.update(mapKey, (value) => inputValue);
  }

  formOnSubmission() async {
    if (formValues["password"]!.isEmpty) {
      showSnackMessage('password Required', context);
    }
    else if (formValues["confirmPassword"]!.isEmpty) {
      showSnackMessage('Confirm Password Required', context);
    }
    else if (formValues["password"]! == formValues["confirmPassword"]!) {
      showSnackMessage('Password and Confirm password should be same', context);
    }
    else {
      setState(() {
        isLoading = true;
      });
      bool res = await setPasswordRequest(formValues, context);

      if (res) {
        //navigation to dashboard
        Navigator.pushNamedAndRemoveUntil(
            context, '/new_task_create', (route) => false);
      }
      else {

      }
      setState(() {
        isLoading = false;
      });
    }
  }

  callStoredData() async{
    String? email = await readUserData('verifyEmail');
    String? otp = await readUserData('otp');
    inputOnChange("email", email);
    inputOnChange("OTP", otp);
  }



  @override
  void initState() {
    callStoredData();
    super.initState();
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
                Text('Set Password', style: head1Text(colorDarkBlue),),
                const SizedBox(height: 10,),
                Text(
                    'Minimum length password 8 charecter with Letter and number combination',
                style: head6Text(colorDarkBlue),),
                const SizedBox(height: 10,),
                TextFormField(
                  onChanged: (inputValue){
                    inputOnChange('password', inputValue);
                  },
                    decoration: appInputDecoration('Password')),
                const SizedBox(height: 10,),
                TextFormField(
                  onChanged: (inputValue){
                    inputOnChange('confirmPassword', inputValue);
                  },
                    decoration: appInputDecoration('Confirm Password')),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: (){
                      formOnSubmission();
                    },
                    style: okButtonStyle(),
                    child: const Text('Confirm'),),
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
