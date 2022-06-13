import 'package:flutter/material.dart';

import '../assets/login_register_assets.dart';
import '../style/color.dart';

class LoginFormWidget extends StatelessWidget {
  final bool isPasswordHide;
  final void Function() onClickViewHidePassword;
  final TextEditingController passwordController;
  final void Function() onClickLogin;
  final FocusNode passwordFocusNode;
  const LoginFormWidget(
      {Key? key,
      required this.onClickViewHidePassword,
      required this.isPasswordHide,
      required this.onClickLogin,
      required this.passwordController, required this.passwordFocusNode})
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
          _userField(),
          const SizedBox(height: 10),
          _passwordField(),
          const SizedBox(height: 10),
          _buttonContinue(),
          const SizedBox(height: 20),
          _forgotPassword()
        ],
      ),
    );
  }

  Widget _userField() {
    return SizedBox(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    LoginRegisterAsset.userDummyPic,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "John Doe",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "johndoe@gmail.com",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _passwordField() {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: passwordController,
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
      onPressed: onClickLogin,
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
