import 'package:flutter/material.dart';

import '../style/color.dart';

class RegisterFormWidget extends StatelessWidget {
  final bool isPasswordHide;
  final void Function() onClickViewHidePassword;
  const RegisterFormWidget(
      {Key? key,
      required this.onClickViewHidePassword,
      required this.isPasswordHide})
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
          _passwordField(),
          const SizedBox(height: 10),
          _warningRegister(),
          const SizedBox(height: 10),
          _buttonContinue(),
        ],
      ),
    );
  }

  Widget _emailField() {
    return SizedBox(
      height: 40,
      child: TextFormField(
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

  Widget _passwordField() {
    return SizedBox(
      height: 40,
      child: TextFormField(
        obscureText: isPasswordHide,
        style: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
          fillColor: Colors.white,
          hintText: "Password",
          hintStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.white.withOpacity(0.5),
          ),
          suffixIcon: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: InkWell(
              onTap: () {
                onClickViewHidePassword();
              },
              child: Text(
                isPasswordHide ? "view" : "hide",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
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
      onPressed: () {},
      child: const Text(
        "Agree and continue",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Color(LoginRegisterColor.primaryFontColor),
          fontFamily: "Poppins",
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _warningRegister() {
    return const Text.rich(
      TextSpan(
          text: "By selecting Agree and continue below, \n i agree to",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(LoginRegisterColor.primaryFontColor),
            fontFamily: "Poppins",
            fontSize: 12,
          ),
          children: [
            TextSpan(
                text: "Term of Service and Privacy Policy",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(LoginRegisterColor.secondaryButtonColor),
                  fontFamily: "Poppins",
                  fontSize: 12,
                )),
          ]),
      textAlign: TextAlign.left,
    );
  }
}
