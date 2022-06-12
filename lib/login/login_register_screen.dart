import 'package:flutter/material.dart';
import 'package:lina/login/assets/login_register_assets.dart';
import 'package:lina/login/login_screen.dart';
import 'package:lina/login/register_screen.dart';
import 'package:lina/login/widgets/login_register_form_widget.dart';

/// ref : https://dribbble.com/shots/15266900-Mobile-app-login-screen-and-sign-up-flow
class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  final TextEditingController emailController = TextEditingController(text: "");
  void onClickContinue() {
    if (emailController.text == "johndoe@gmail.com") {
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return const LoginScreen();
      })));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return const RegisterScreen();
      })));
    }
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
                height: 140,
              ),
              const Text(
                "Welcome to Rotee!",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              LoginRegisterFormWidget(
                emailController: emailController,
                onClickContinue: onClickContinue,
                onSignUpClicked: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const RegisterScreen();
                  })));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
