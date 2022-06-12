import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../assets/login_register_assets.dart';
import '../style/color.dart';

class LoginRegisterFormWidget extends StatelessWidget {
  final void Function() onSignUpClicked;
  final void Function() onClickContinue;
  final TextEditingController emailController;
  const LoginRegisterFormWidget({Key? key, required this.emailController ,required this.onClickContinue, required this.onSignUpClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
              BorderSide(color: Colors.white.withOpacity(0.3)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _emailField(),
          const SizedBox(height: 10),
          _buttonContinue(),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "OR",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          _continueWith(
              assetFileName: LoginRegisterAsset.googleLogo, appName: "Google"),
          const SizedBox(height: 10),
          _continueWith(
              assetFileName: LoginRegisterAsset.facebookLogo,
              appName: "Facebook"),
          const SizedBox(height: 10),
          _continueWith(
              assetFileName: LoginRegisterAsset.appleLogo, appName: "Apple"),
          const SizedBox(height: 10),
          _dontHaveAnAccount(),
          const SizedBox(height: 15),
          _forgotPassword(),
        ],
      ),
    );
  }

  Widget _emailField() {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: emailController,
        style: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          fillColor: Colors.white,
          hintText: "Email",
          hintStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.white.withOpacity(0.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buttonContinue() {
    return MaterialButton(
      minWidth: 500,
      height: 40,
      color: const Color(LoginRegisterColor.primaryColor),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              const BorderSide(color: Color(LoginRegisterColor.primaryColor))),
      onPressed: () {
        return onClickContinue();
      },
      child: const Text(
        "Continue",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Color(LoginRegisterColor.primaryFontColor),
          fontFamily: "Poppins",
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _continueWith(
      {required String appName, required String assetFileName}) {
    return MaterialButton(
      minWidth: 500,
      height: 40,
      color: const Color(LoginRegisterColor.secondaryButtonColor),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
              color: Color(LoginRegisterColor.secondaryButtonColor))),
      onPressed: () {},
      child: Row(
        children: [
          Image.asset(
            assetFileName,
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            "Continue with $appName",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(LoginRegisterColor.primaryFontColor),
              fontFamily: "Poppins",
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget _dontHaveAnAccount() {
    return Text.rich(
      TextSpan(
          text: "Don't have an account ? ",
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(LoginRegisterColor.primaryFontColor),
            fontFamily: "Poppins",
            fontSize: 12,
          ),
          children: [
            TextSpan(
                text: "Sign up",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(LoginRegisterColor.secondaryButtonColor),
                  fontFamily: "Poppins",
                  fontSize: 12,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = (){
                    return onSignUpClicked();
                  }),
          ]),
      textAlign: TextAlign.left,
    );
  }

  Widget _forgotPassword() {
    return const Text(
      "Forgot your password ?",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: Color(LoginRegisterColor.primaryFontColor),
        fontFamily: "Poppins",
        fontSize: 12,
      ),
    );
  }
}
