import 'package:flutter/material.dart';
import 'package:lina/home/navigation_screen.dart';
import 'package:lina/login/widgets/login_form_widget.dart';

import 'assets/login_register_assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHide = true;
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  void changeIsPasswordHide() {
    setState(() {
      isPasswordHide = !isPasswordHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  LoginRegisterAsset.loginRegisterBg,
                ))),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 130,
              ),
              const Text(
                "Sign In",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              LoginFormWidget(
                isPasswordHide: isPasswordHide,
                onClickViewHidePassword: changeIsPasswordHide,
                onClickLogin: () {
                  if (passwordController.text == "123456") {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const NavigationScreen();
                    }));
                  }
                },
                passwordController: passwordController,
                passwordFocusNode: passwordFocusNode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
